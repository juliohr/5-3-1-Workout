require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { is_expected.to have_and_belong_to_many(:workouts) }
  it { is_expected.to have_many(:exercise_sets) }
  
  it "is valid with valid attributes" do
    expect(FactoryGirl.build(:exercise)).to be_valid
  end
  
  it "is invalid without name" do
    expect(FactoryGirl.build(:exercise, name: nil)).to_not be_valid
  end
end
