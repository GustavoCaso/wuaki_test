class SeasonSerializer < ActiveModel::Serializer
  self.root = false
  attributes :title, :plot, :price, :created_at

  has_many :episodes
end
