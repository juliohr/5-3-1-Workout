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

  describe ".initialize_workouts" do
    let(:workouts) { FactoryGirl.build(
      :workout,
      one_rm_squat: 100,
      one_rm_bench_press: 90,
      one_rm_deadlift: 80,
      one_rm_overhead_press: 70
    )}

    before { workout.initialize_workouts }
  end
end
