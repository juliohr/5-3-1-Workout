require 'rails_helper'
RSpec.describe CyclesController, type: :controller do

  let (:program_1) { FactoryGirl.create(:program) }
  let (:program_2) { FactoryGirl.create(:program) }
  let (:program_1_cycle) { program_1.cycles.first }
  let (:program_2_cycle) { program_2.cycles.first }
  let (:workout) { FactoryGirl.create(:workout, cycle_week:1) }
 
  describe "GET #index" do
    
    before { get :index, params: { program_id: program_1.id } }

    it "assignes cycles from a given program_id to @cycles" do
      expect(assigns(:cycles)).to eq([program_1_cycle])
      expect(assigns(:cycles)).to_not eq([program_2_cycle])
    end

    it { is_expected.to render_template :index }
    it { is_expected.to respond_with :ok }
  end

  describe "GET #show" do
    before do
      program_1_cycle.workouts << workout
      get :show, params: { id: program_1_cycle.id, program_id: program_1.id }
    end 

    it "assignes cycle, program and workout given a cycle and a program" do
      expect(assigns(:program)).to eq(program_1)
      expect(assigns(:cycle)).to eq(program_1_cycle)
      expect(assigns(:workouts)[:"Cycle Week 1"].first).to eq(workout)
    end

    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :ok }
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new cycle" do
        expect {
            post :create, params: { program_id: program_1.id }
          }.to change(program_1.cycles, :count).by(1)
      end

      before { post :create, params: { program_id: program_1.id } }
      it { is_expected.to render_template :show }
      it { is_expected.to respond_with :created }
    end

    xcontext "with invalid params"
  end

  describe ".group_by_cycle_week" do
    let (:workouts) { [] }
    let (:workout_1) { FactoryGirl.create(:workout, cycle_week: 1) }
    let (:workout_2) { FactoryGirl.create(:workout, cycle_week: 2) }
    let (:workout_3) { FactoryGirl.create(:workout, cycle_week: 3) }
    let (:workout_4) { FactoryGirl.create(:workout, cycle_week: 4) }

    it "groups an array of workouts by cycle week" do

      [workout_1, workout_2, workout_3, workout_4].each do |workout|
        workouts << workout
      end

      expected_return = {
        "Cycle Week 1": [workout_1],
        "Cycle Week 2": [workout_2],
        "Cycle Week 3": [workout_3],
        "Cycle Week 4": [workout_4],
      }

      expect(controller.send(:group_by_cycle_week, workouts)).to eq(expected_return)
    end
  end

  describe ".filter_attributes" do
    it "filters attributs from a Program instance" do
      expected_return = {
        "one_rm_squat" => program_1.one_rm_squat,
        "one_rm_bench_press" => program_1.one_rm_bench_press,
        "one_rm_deadlift" => program_1.one_rm_deadlift,
        "one_rm_overhead_press" => program_1.one_rm_overhead_press
      }
      expect(controller.send(:filter_attributes, program_1)).to eq(expected_return)
    end
  end
end