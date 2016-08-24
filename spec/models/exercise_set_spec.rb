require 'rails_helper'

RSpec.describe ExerciseSet, type: :model do
  it "is valid with valid attributes" do
  	expect(FactoryGirl.build(:exercise_set)).to be_valid
  end
  it "is invalid without weight" do
  	expect(FactoryGirl.build(:exercise_set, weight: nil)).to_not be_valid
  end
  it "is invalid without reps" do
  	expect(FactoryGirl.build(:exercise_set, reps: nil)).to_not be_valid
  end
end
