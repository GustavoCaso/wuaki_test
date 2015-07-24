class LibrarySerializer < ActiveModel::Serializer
  has_many :user_movies
  has_many :user_seasons

  def user_movies
    object.user_movies.active_by_expire_date(Time.now)
  end

  def user_seasons
    object.user_seasons.active_by_expire_date(Time.now)
  end
end
