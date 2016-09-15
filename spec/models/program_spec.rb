require 'rails_helper'

RSpec.describe Program, type: :model do

  let (:program) { FactoryGirl.build(:program) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:cycles) }
  it { is_expected.to validate_presence_of(:one_rm_squat) }
  it { is_expected.to validate_presence_of(:one_rm_bench_press) }
  it { is_expected.to validate_presence_of(:one_rm_deadlift) }
  it { is_expected.to validate_presence_of(:one_rm_overhead_press) }
  it { is_expected.to validate_presence_of(:start_date) }

  it { expect(program).to be_valid }

  describe ".initialize_cycle" do
    let (:program) { FactoryGirl.build(
      :program,
      one_rm_squat: 100,
      one_rm_bench_press: 90,
      one_rm_deadlift: 70,
      one_rm_overhead_press: 60,
    )}

    before { program.cycles = [] }

    before { program.initialize_cycle }

    it { expect(program.cycles).to_not be_empty }

    context "cycle number" do
      it { expect(program.cycles.first.number).to eq(1)}
    end

    context "cycle workouts" do
      it { expect(program.cycles.first.workouts.size).to eq(16)}
    end
  end
end
