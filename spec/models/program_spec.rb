require 'rails_helper'

RSpec.describe Program, type: :model do
  it { is_expected.to have_many(:cycles) }

  it "is valid with valid attributes" do
  	expect(FactoryGirl.build(:program)).to be_valid
  end

  it "is not valid without a name" do
  	expect(FactoryGirl.build(:program, person_name: nil)).to_not be_valid 
  end

  it "is not valid without a 1rm squat" do
    expect(FactoryGirl.build(:program, one_rm_squat: nil)).to_not be_valid 
  end

  it "is not valid without a 1rm bench press" do
    expect(FactoryGirl.build(:program, one_rm_bench_press: nil)).to_not be_valid 
  end

  it "is not valid without a 1rm deadlift" do
    expect(FactoryGirl.build(:program, one_rm_deadlift: nil)).to_not be_valid 
  end

  it "is not valid without a 1rm overhead press" do
    expect(FactoryGirl.build(:program, one_rm_overhead_press: nil)).to_not be_valid 
  end

  it "is not valid without a start_date" do
    expect(FactoryGirl.build(:program, start_date: nil)).to_not be_valid 
  end

  describe ".initialize_cycle" do
    let (:program) { FactoryGirl.build(
      :program,
      one_rm_squat: 100,
      one_rm_bench_press: 90,
      one_rm_deadlift: 70,
      one_rm_overhead_press: 60,
    )}
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
