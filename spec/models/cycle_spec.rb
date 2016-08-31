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
    all_one_rm_max = {
      one_rm_squat: 100,
      one_rm_bench_press: 90,
      one_rm_deadlift: 70,
      one_rm_overhead_press: 60
    }
    before { cycle.initialize_workouts(all_one_rm_max) }

    context "workouts" do
      it { expect(cycle.workouts).to_not be_empty }
      context "total" do
        it { expect(cycle.workouts.size).to eq(16) }
      end
    end
  end
end
