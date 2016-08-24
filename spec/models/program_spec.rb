require 'rails_helper'

RSpec.describe Program, type: :model do
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

  it "is not valid without a cycle" do
    expect(FactoryGirl.build(:program, cycle: nil)).to_not be_valid 
  end
end
