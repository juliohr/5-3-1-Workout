require 'rails_helper'
RSpec.describe CyclesController, type: :controller do

  let (:program_1) { FactoryGirl.create(:program) }
  let (:program_2) { FactoryGirl.create(:program) }
  let (:program_1_cycle) { program_1.cycles.first }
  let (:program_2_cycle) { program_2.cycles.first }
  let (:workout) { FactoryGirl.create(:workout, cycle_week:1) }

  before do
    controller.session[:user_id] = program_1.user.id 
    program_2
  end
 
  describe "GET #index" do

    before { get :index, params: { program_id: program_1.id } }

    it { expect(assigns(:cycles)).to eq([program_1_cycle]) }
    it { expect(assigns(:cycles)).to_not eq([program_2_cycle]) }
    it { is_expected.to render_template :index }
    it { is_expected.to respond_with :ok }
  end

  describe "GET #show" do
    before do
      program_1_cycle.workouts << workout
      get :show, params: { id: program_1_cycle.id, program_id: program_1.id }
    end 

    it { expect(assigns(:program)).to eq(program_1) }
    it { expect(assigns(:cycle)).to eq(program_1_cycle) }
    it { expect(assigns(:workouts)[:"Cycle Week 1"].first).to eq(workout) }
    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :ok }
  end

  describe "POST #create" do
    context "with valid params" do

      before { post :create, params: { program_id: program_1.id } }

      it { expect(program_1.cycles.count).to eq(2) }      
      it { is_expected.to render_template :show }
      it { is_expected.to respond_with :created }
    end

    context "with invalid params"
  end

  describe ".group_by_cycle_week" do
    let (:workouts) { [] }
    let (:workout_1) { FactoryGirl.create(:workout, cycle_week: 1) }
    let (:workout_2) { FactoryGirl.create(:workout, cycle_week: 2) }
    let (:workout_3) { FactoryGirl.create(:workout, cycle_week: 3) }
    let (:workout_4) { FactoryGirl.create(:workout, cycle_week: 4) }
    let (:expected_cycle_week) { {
        "Cycle Week 1": [workout_1],
        "Cycle Week 2": [workout_2],
        "Cycle Week 3": [workout_3],
        "Cycle Week 4": [workout_4]
      } }

    before { [workout_1, workout_2, workout_3, workout_4].each { |workout| workouts << workout } }


    it { expect(controller.send(:group_by_cycle_week, workouts)).to eq(expected_cycle_week) }
  end

  describe ".increment_program_one_rms" do
    let (:expected_incremented_program_one_rms) {

    }
    before do 
      post :create, params: { program_id: program_1.id }
      controller.send(:increment_program_one_rms)
       get :show, params: { id: program_1_cycle.id, program_id: program_1.id }
    end

    it { expect(assigns(:program)[:one_rm_squat]).to eq(program_1.one_rm_squat + 5) }
    it { expect(assigns(:program)[:one_rm_bench_press]).to eq(program_1.one_rm_bench_press + 2.5) }
    it { expect(assigns(:program)[:one_rm_deadlift]).to eq(program_1.one_rm_deadlift + 5) }
    it { expect(assigns(:program)[:one_rm_overhead_press]).to eq(program_1.one_rm_overhead_press + 2.5) }

  end

  describe ".program_filter_attributes" do
    let (:expected_filtered_attributes) { {
        "one_rm_squat" => program_1.one_rm_squat + 5,
        "one_rm_bench_press" => program_1.one_rm_bench_press + 2.5,
        "one_rm_deadlift" => program_1.one_rm_deadlift + 5,
        "one_rm_overhead_press" => program_1.one_rm_overhead_press + 2.5
      } }

    before { post :create, params: { program_id: program_1.id } }

    it { expect(controller.send(:program_filtered_attributes)).to eq(expected_filtered_attributes) }
  end
end