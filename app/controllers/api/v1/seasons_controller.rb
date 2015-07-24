class Api::V1::SeasonsController < Api::V1::BaseController
  before_filter :find_seasons, only: :index
  before_filter :find_season, only: :create
  before_filter :find_user, only: :create

  def index
    if !@seasons.empty?
      render json: @seasons, meta: {total: @seasons.count}
    else
      render json: {message: 'No Seasons'}, status: :no_content
    end
  end

  def create
    check_if_user_has_season
  end

  private
  def find_seasons
    @seasons ||= Season.get_all_seasons
  end

  def find_season
    if params[:season_id].present?
      begin
        @season = Season.find(params[:season_id])
      rescue ActiveRecord::RecordNotFound
        render nothing: true, status: :no_content
      end
    else
      render json: { error: 'You must supply season_id' }, status: :bad_request
    end
  end

  def check_if_user_has_season
    if @user.library.seasons.include?(@season)
      # if he already bought we check if the last on has expire or not
      last_season = @user.library.user_seasons.where(season_id: @season.id).last
      if last_season.expire_at > Time.now
        #The season still not expire
        render json: { message: 'Season already in the library' }, status: :ok
      else
        # The season has expire but he can purchased again
        @user.library.seasons << @season
        render json: @season , status: :created
      end
    else
      #The user has never buy it before
      @user.library.seasons << @season
      render json: @season , status: :created
    end
  end
end
