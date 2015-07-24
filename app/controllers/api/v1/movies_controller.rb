class Api::V1::MoviesController < Api::V1::BaseController
  before_filter :find_movies, only: :index
  before_filter :find_movie, only: :create
  before_filter :find_user, only: :create

  def index
    if !@movies.empty?
      render json: @movies, meta: { total:  @movies.count}
    else
      render json:{message: 'No Movies'} , status: :no_content
    end
  end

  def create
    check_if_user_has_movie
  end

  private
  def find_movies
    @movies ||= Movie.get_all_movies
  end

  def find_movie
    if params[:movie_id].present?
      begin
        @movie = Movie.find(params[:movie_id])
      rescue ActiveRecord::RecordNotFound
        render nothing: true, status: :no_content
      end
    else
      render json: { error: 'You must supply movie_id' }, status: :bad_request
    end
  end

  def check_if_user_has_movie
    if @user.library.movies.include?(@movie)
      # if he already bought we check if the last on has expire or not
      last_movie = @user.library.user_movies.where(movie_id: @movie.id).last
      if last_movie.expire_at > Time.now
        #The movie still not expire
        render json: { message: 'Movie already in the library'}, status: :ok
      else
        # The movie has expire but he can purchased again
        @user.library.movies << @movie
        render json: @movie, status: :created
      end
    else
      #The user has never buy it before
      @user.library.movies << @movie
      render json: @movie, status: :created
    end
  end
end
