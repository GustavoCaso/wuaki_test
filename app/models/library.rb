class Library < ActiveRecord::Base
  belongs_to :user
  has_many :user_movies
  has_many :movies, through: :user_movies
  has_many :user_seasons
  has_many :seasons, through: :user_seasons

  def get_all_content_by_time_to_watch
    actual_time = Time.now
    {
      "movies": serialize_movies(get_all_movies(actual_time)),
      "seasons": serialize_seasons(get_all_seasons(actual_time))
    }
  end

  private
  def get_all_movies(current_time)
    movies.active_by_expire_date(current_time)
  end

  def serialize_movies(movies)
    movies.map { |x| MovieSerializer.new(x).as_json }
  end

  def serialize_seasons(seasons)
    seasons.map { |x| SeasonSerializer.new(x).as_json }
  end

  def get_all_seasons(current_time)
    seasons.active_by_expire_date(current_time)
  end
end
