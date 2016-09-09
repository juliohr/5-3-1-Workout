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

  xdescribe "POST #create" do
    context "with valid params" do
      it "creates a new cycle"

      it { is_expected.to redirect_to :index }
      it { is_expected.to respond_with :created }
    end

    context "with invalid params" do
      
    end
  end
end