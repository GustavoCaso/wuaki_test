module UpdatePurchasedAndExpire
  extend ActiveSupport::Concern

  included do
    before_save :update_purchased_at
    before_save :update_expire_at
  end

  private
  def update_purchased_at
    if !self.purchased_at.present?
      self.purchased_at = Time.now
    end
  end

  def update_expire_at
    if !self.expire_at.present?
      self.expire_at = self.purchased_at + 2.days
    end
  end
end
