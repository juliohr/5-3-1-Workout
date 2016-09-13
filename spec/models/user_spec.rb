require 'rails_helper'

RSpec.describe User, type: :model do
  
  let (:user) { FactoryGirl.build(:user) }
  
  it { expect(user).to be_valid }

  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
end
