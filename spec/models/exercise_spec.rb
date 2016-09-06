require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { is_expected.to have_many(:workouts) }
  it { is_expected.to have_many(:exercise_workouts) }
  it { is_expected.to have_many(:exercise_sets) }
  
  it "is valid with valid attributes" do
    expect(FactoryGirl.build(:exercise)).to be_valid
  end
  
  it "is invalid without name" do
    expect(FactoryGirl.build(:exercise, name: nil)).to_not be_valid
  end

  describe ".exercise_sets" do
    context "squat" do
      let (:exercise) { FactoryGirl.build(:exercise) }
      let (:one_rm) { 100 }

      context "cycle_week 1" do
        let (:cycle_week) { 1 }
        before { exercise.initialize_sets(cycle_week, one_rm) }

        context ".exercise_sets.size" do
          it { expect(exercise.exercise_sets.size).to eq(6) }
        end

        context ".exercise_sets[0].weight" do
          it { expect(exercise.exercise_sets[0].weight).to eq(40) }
        end

        context ".exercise_sets[0].reps" do
          it { expect(exercise.exercise_sets[0].reps).to eq(5) }
        end

        context ".exercise_sets[1].weight" do
          it { expect(exercise.exercise_sets[1].weight).to eq(47) }
        end

        context ".exercise_sets[1].reps" do
          it { expect(exercise.exercise_sets[1].reps).to eq(5) }
        end

        context ".exercise_sets[2].weight" do
          it { expect(exercise.exercise_sets[2].weight).to eq(55) }
        end

        context ".exercise_sets[2].reps" do
          it { expect(exercise.exercise_sets[2].reps).to eq(3) }
        end

        context ".exercise_sets[3].weight" do
          it { expect(exercise.exercise_sets[3].weight).to eq(65) }
        end

        context ".exercise_sets[3].reps" do
          it { expect(exercise.exercise_sets[3].reps).to eq(5) }
        end

        context ".exercise_sets[4].weight" do
          it { expect(exercise.exercise_sets[4].weight).to eq(75) }
        end

        context ".exercise_sets[4].reps" do
          it { expect(exercise.exercise_sets[4].reps).to eq(5) }
        end

        context ".exercise_sets[5].weight" do
          it { expect(exercise.exercise_sets[5].weight).to eq(85) }
        end

        context ".exercise_sets[5].reps" do
          it { expect(exercise.exercise_sets[5].reps).to eq(5) }
        end
      end

      context "cycle_week 2" do
        let (:cycle_week) { 2 }

        before { exercise.initialize_sets(cycle_week, one_rm) }

        context ".exercise_sets.size" do
          it { expect(exercise.exercise_sets.size).to eq(6) }
        end

        context ".exercise_sets[0].weight" do
          it { expect(exercise.exercise_sets[0].weight).to eq(40) }
        end

        context ".exercise_sets[0].reps" do
          it { expect(exercise.exercise_sets[0].reps).to eq(5) }
        end

        context ".exercise_sets[1].weight" do
          it { expect(exercise.exercise_sets[1].weight).to eq(50) }
        end

        context ".exercise_sets[1].reps" do
          it { expect(exercise.exercise_sets[1].reps).to eq(5) }
        end

        context ".exercise_sets[2].weight" do
          it { expect(exercise.exercise_sets[2].weight).to eq(60) }
        end

        context ".exercise_sets[2].reps" do
          it { expect(exercise.exercise_sets[2].reps).to eq(3) }
        end

        context ".exercise_sets[3].weight" do
          it { expect(exercise.exercise_sets[3].weight).to eq(70) }
        end

        context ".exercise_sets[3].reps" do
          it { expect(exercise.exercise_sets[3].reps).to eq(3) }
        end

        context ".exercise_sets[4].weight" do
          it { expect(exercise.exercise_sets[4].weight).to eq(80) }
        end

        context ".exercise_sets[4].reps" do
          it { expect(exercise.exercise_sets[4].reps).to eq(3) }
        end

        context ".exercise_sets[5].weight" do
          it { expect(exercise.exercise_sets[5].weight).to eq(90) }
        end

        context ".exercise_sets[5].reps" do
          it { expect(exercise.exercise_sets[5].reps).to eq(3) }
        end
      end

      context "cycle_week 3" do
        let (:cycle_week) { 3 }

        before { exercise.initialize_sets(cycle_week, one_rm) }

        context ".exercise_sets.size" do
          it { expect(exercise.exercise_sets.size).to eq(6) }
        end

        context ".exercise_sets[0].weight" do
          it { expect(exercise.exercise_sets[0].weight).to eq(40) }
        end

        context ".exercise_sets[0].reps" do
          it { expect(exercise.exercise_sets[0].reps).to eq(5) }
        end

        context ".exercise_sets[1].weight" do
          it { expect(exercise.exercise_sets[1].weight).to eq(50) }
        end

        context ".exercise_sets[1].reps" do
          it { expect(exercise.exercise_sets[1].reps).to eq(5) }
        end

        context ".exercise_sets[2].weight" do
          it { expect(exercise.exercise_sets[2].weight).to eq(60) }
        end

        context ".exercise_sets[2].reps" do
          it { expect(exercise.exercise_sets[2].reps).to eq(3) }
        end

        context ".exercise_sets[3].weight" do
          it { expect(exercise.exercise_sets[3].weight).to eq(75) }
        end

        context ".exercise_sets[3].reps" do
          it { expect(exercise.exercise_sets[3].reps).to eq(5) }
        end

        context ".exercise_sets[4].weight" do
          it { expect(exercise.exercise_sets[4].weight).to eq(85) }
        end

        context ".exercise_sets[4].reps" do
          it { expect(exercise.exercise_sets[4].reps).to eq(3) }
        end

        context ".exercise_sets[5].weight" do
          it { expect(exercise.exercise_sets[5].weight).to eq(95) }
        end

        context ".exercise_sets[5].reps" do
          it { expect(exercise.exercise_sets[5].reps).to eq(1) }
        end
      end

      context "cycle_week 4" do
        let (:cycle_week) { 4 }

        before { exercise.initialize_sets(cycle_week, one_rm) }

        context ".exercise_sets.size" do
          it { expect(exercise.exercise_sets.size).to eq(3) }
        end

        context ".exercise_sets[0].weight" do
          it { expect(exercise.exercise_sets[0].weight).to eq(40) }
        end

        context ".exercise_sets[0].reps" do
          it { expect(exercise.exercise_sets[0].reps).to eq(5) }
        end

        context ".exercise_sets[1].weight" do
          it { expect(exercise.exercise_sets[1].weight).to eq(50) }
        end

        context ".exercise_sets[1].reps" do
          it { expect(exercise.exercise_sets[1].reps).to eq(5) }
        end

        context ".exercise_sets[2].weight" do
          it { expect(exercise.exercise_sets[2].weight).to eq(60) }
        end

        context ".exercise_sets[2].reps" do
          it { expect(exercise.exercise_sets[2].reps).to eq(5) }
        end
      end
    end
  end
end