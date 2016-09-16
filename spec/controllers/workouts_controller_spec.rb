require 'rails_helper'
RSpec.describe WorkoutsController, type: :controller do

  let(:program) { FactoryGirl.create(:program)}
  let(:workout) { FactoryGirl.create(:workout, :with_exercise) }

  before do
    controller.session[:user_id] = program.user.id 
    allow(ExerciseSet).to receive_message_chain(:where, :all)
  end

  describe "GET #show" do
    it "assigns the requested workout as @workout" do
      get :show, params: { id: workout.id, program_id: program.id }
      expect(assigns(:workout)).to eq(workout)
    end

    it "renders the #show view" do
      get :show, params: { id: workout.id, program_id: program.id }
      expect(response).to render_template :show
    end
  end

  describe "PUT #update" do
    it "updates status" do
      workout
      put :update, params: { id: workout.id, status: 2 }
      workout.reload
      expect(workout.status).to eq(2)
    end
  end
end