require 'rails_helper'

RSpec.describe ExerciseSet, type: :model do

  let (:exercise_set) { FactoryGirl.build(:exercise_set) }

  it { expect(exercise_set).to be_valid }
  	
  it { is_expected.to belong_to(:exercise) }
  it { is_expected.to validate_presence_of(:exercise).with_message('must exist') }
  it { is_expected.to validate_presence_of(:weight) }
  it { is_expected.to validate_presence_of(:reps) }
end
