require 'rails_helper'

RSpec.describe Workout, type: :model do

  let (:workout) { FactoryGirl.build(:workout) }

  it { is_expected.to have_many(:exercises) }
  it { is_expected.to have_many(:exercise_workouts) }
  it { is_expected.to belong_to(:cycle) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:cycle_week) }

  it { expect(workout).to be_valid }

  describe ".initialize_exercise" do
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
