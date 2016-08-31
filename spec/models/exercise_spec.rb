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

  describe "#New" do
    context "squat" do
      describe ".exercise_sets" do
        context "cycle_week 1" do
          let (:exercise) { FactoryGirl.build(:exercise, one_rm: 100, cycle_week: 1) }
          before { exercise.initialize_sets }

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
      end
    end
  end
end