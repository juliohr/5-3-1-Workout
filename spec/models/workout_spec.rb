require 'rails_helper'

RSpec.describe Workout, type: :model do
  it { is_expected.to have_and_belong_to_many(:exercises) }
  it { is_expected.to belong_to(:program) }
  it { is_expected.to belong_to(:cycle) }

  it "is valid with valid attributes" do
    expect(FactoryGirl.build(:workout)).to be_valid
  end

  it "is invalid without cycle week" do
    expect(FactoryGirl.build(:workout, cycle_week: nil)).to_not be_valid
  end
end
