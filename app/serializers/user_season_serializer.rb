class UserSeasonSerializer < ActiveModel::Serializer
  attributes :expire_at

  has_one :season
end
