class Episode < ActiveRecord::Base
  belongs_to :season, touch: true

  validates_uniqueness_of :number, scope: :season_id

  def total_episodes
    self.season.episodes.count
  end
end
