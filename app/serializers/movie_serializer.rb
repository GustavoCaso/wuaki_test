class MovieSerializer < ActiveModel::Serializer
  self.root = false
  attributes :title, :plot, :price, :created_at
end
