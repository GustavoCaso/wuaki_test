module ActiveScope
  extend ActiveSupport::Concern

  included do
    scope :active_by_expire_date, ->(time) { where('expire_at > ?', time)
                                             .order('expire_at DESC') }
  end
end
