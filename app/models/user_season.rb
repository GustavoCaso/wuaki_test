class UserSeason < ActiveRecord::Base
  include UpdatePurchasedAndExpire

  belongs_to :library, touch: true
  belongs_to :season

end
