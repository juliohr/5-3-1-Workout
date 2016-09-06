require 'rails_helper'

RSpec.describe Workout, type: :model do
  it { is_expected.to have_many(:exercises) }
  it { is_expected.to have_many(:exercise_workouts) }
  it { is_expected.to belong_to(:cycle) }

  it "is valid with valid attributes" do
    expect(FactoryGirl.build(:workout)).to be_valid
  end

  it "is invalid without cycle week" do
    expect(FactoryGirl.build(:workout, cycle_week: nil)).to_not be_valid
  end

  describe ".initialize_exercise" do
    let (:workout) { FactoryGirl.build(:workout, cycle_week: 1) }
    one_rm = 100
    before { workout.initialize_exercise("squat", one_rm) }

    context "exercises" do
      it { expect(workout.exercises.size).to eq(1)}
      
      context "exercise name" do
        it { expect(workout.exercises.first.name).to eq("squat") }
      end

      context "exercise sets" do
        it { expect(workout.exercises.first.exercise_sets.size).to eq(6) }
      end
    end
  end
end
