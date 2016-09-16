require 'rails_helper'
RSpec.describe WorkoutsController, type: :controller do

  let(:program) { FactoryGirl.create(:program)}
  let(:workout) { FactoryGirl.create(:workout, :with_exercise) }

  before { controller.session[:user_id] = program.user.id }

  describe "GET #show" do
    before { get :show, params: { id: workout.id, program_id: program.id } }
    
    it { expect(assigns(:workout)).to eq(workout) }
    it { expect(response).to render_template :show }

    context "when workout does not belong to user program" do
        before { get :show, params: { id: workout.id, program_id: (program.id + 1) } }
        it { expect(response).to redirect_to '/' }
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