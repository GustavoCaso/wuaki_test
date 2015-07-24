require 'spec_helper'

describe User do
  describe 'Validations' do
    context 'Invalid email' do
      it 'will trigger an error for invalid email' do
        user = build(:user, email: '2335q767w97')
        expect(user).to have(1).errors_on(:email)
      end

      it 'will trigger error for duplicate emails' do
        user = create(:user)
        user2 = build(:user, email: 'wuaki_user@gmail.com')
        expect(user2).to have(1).errors_on(:email)
      end
    end
  end
end
