class UserMovieSerializer < ActiveModel::Serializer
  attributes :expire_at

  has_one :movie
end
