class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_one :library

  validates_uniqueness_of :email
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
