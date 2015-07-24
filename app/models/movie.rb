class Movie < ActiveRecord::Base
  include ActiveScope

  default_scope { order('created_at DESC') }

  has_many :user_movies
  has_many :libraries, through: :user_movies

  def self.get_all_movies
    Rails.cache.fetch(cache_key_for_movies) do
      Movie.all
    end
  end

  private
  def self.cache_key_for_movies
    count = Movie.count
    max_updated_at = Movie.maximum(:created_at).try(:to_s, :number)
    "movies/all-#{count}-#{max_updated_at}"
  end
end
