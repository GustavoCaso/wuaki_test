class UserMovie < ActiveRecord::Base
  include UpdatePurchasedAndExpire

  belongs_to :library, touch: true
  belongs_to :movie
end
