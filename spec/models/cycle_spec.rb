require 'rails_helper'

RSpec.describe Cycle, type: :model do
  it "is valid with valid attributes" do
    expect(FactoryGirl.build(:cycle)).to be_valid
  end

  it "is invalid without required attributes" do
    expect(FactoryGirl.build(:cycle, number: nil)).to be_invalid
  end

  describe ".initialize_workouts" do
    let(:cycle) { FactoryGirl.build(:cycle)}
    all_one_rm = {
      one_rm_squat: 100,
      one_rm_bench_press: 90,
      one_rm_deadlift: 70,
      one_rm_overhead_press: 60
    }
    before { cycle.initialize_workouts(all_one_rm) }

    context "workouts" do
      it { expect(cycle.workouts).to_not be_empty }

      context "total" do
        it { expect(cycle.workouts.size).to eq(16) }
      end

      context "cycle week 1" do
        context "squat" do
          subject(:exercise) { cycle.workouts.select { |w| w[:cycle_week] == 1 && w.exercises.first[:name] == "squat" }.first.exercises.first }
          context "weight" do
            it { expect(exercise.exercise_sets.last.weight).to eq(85) }
          end
          context "reps" do
            it { expect(exercise.exercise_sets.first.reps).to eq(5) } 
          end
        end
      end
    end
  end
end
