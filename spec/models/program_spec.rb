require 'rails_helper'
require 'Cycle'

RSpec.describe Program, type: :model do

	subject { described_class.new }

  it "is valid with valid attributes" do
  	subject.person_name = "Jim"
  	subject.one_rm_squat = 100
  	subject.one_rm_bench_press = 80
  	subject.one_rm_deadlift = 120
  	subject.one_rm_overhead_press = 50
  	subject.start_date = Date.new()
  	subject.cycle = Cycle.new()

  	expect(subject).to be_valid
  end

  it "is not valid without a name" do
  	subject.one_rm_squat = 100
  	subject.one_rm_bench_press = 80
  	subject.one_rm_deadlift = 120
  	subject.one_rm_overhead_press = 50
  	subject.start_date = Date.new()
  	subject.cycle = Cycle.new()

  	expect(subject).to_not be_valid 
  end

  it "is not valid without a 1rm squat" do
  	subject.person_name = "Jim"
  	subject.one_rm_bench_press = 80
  	subject.one_rm_deadlift = 120
  	subject.one_rm_overhead_press = 50
  	subject.start_date = Date.new()
  	subject.cycle = Cycle.new()

  	expect(subject).to_not be_valid 
  end

  it "is not valid without a 1rm bench press" do
  	subject.person_name = "Jim"
  	subject.one_rm_squat = 100
  	subject.one_rm_deadlift = 120
  	subject.one_rm_overhead_press = 50
  	subject.start_date = Date.new()
  	subject.cycle = Cycle.new()

  	expect(subject).to_not be_valid
  end

  it "is not valid without a 1rm deadlift" do
 		subject.person_name = "Jim"
  	subject.one_rm_squat = 100
  	subject.one_rm_bench_press = 80
  	subject.one_rm_overhead_press = 50
  	subject.start_date = Date.new()
  	subject.cycle = Cycle.new()

  	expect(subject).to_not be_valid
  end

  it "is not valid without a 1rm overhead press" do
  	subject.person_name = "Jim"
  	subject.one_rm_squat = 100
  	subject.one_rm_bench_press = 80
  	subject.one_rm_deadlift = 120
  	subject.start_date = Date.new()
  	subject.cycle = Cycle.new()

  	expect(subject).to_not be_valid
  end

  it "is not valid without a start_date" do
  	subject.person_name = "Jim"
  	subject.one_rm_squat = 100
  	subject.one_rm_bench_press = 80
  	subject.one_rm_deadlift = 120
  	subject.one_rm_overhead_press = 50
  	subject.cycle = Cycle.new()

  	expect(subject).to_not be_valid
  end

  it "is not valid without a cycle" do
		subject.person_name = "Jim"
  	subject.one_rm_squat = 100
  	subject.one_rm_bench_press = 80
  	subject.one_rm_deadlift = 120
  	subject.one_rm_overhead_press = 50
  	subject.start_date = Date.new()

  	expect(subject).to_not be_valid  	
  end

end
