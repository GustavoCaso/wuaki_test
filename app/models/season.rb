class Season < ActiveRecord::Base
  include ActiveScope
  default_scope { order('created_at DESC') }

  has_many :episodes, -> { order('number ASC') }
  has_many :user_seasons
  has_many :libraries, through: :user_seasons

  def self.get_all_seasons
    Rails.cache.fetch(cache_key_for_seasons) do
      Season.all
    end
  end

  private
  def self.cache_key_for_seasons
    count = Season.count
    max_updated_at = Season.maximum(:created_at).try(:to_s, :number)
    "seasons/all-#{count}-#{max_updated_at}"
  end
end
