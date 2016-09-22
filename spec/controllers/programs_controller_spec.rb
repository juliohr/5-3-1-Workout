require 'rails_helper'
RSpec.describe ProgramsController, type: :controller do

  let(:program) { FactoryGirl.create(:program) }

  let(:invalid_program) { FactoryGirl.create(:program, person_name: nil) }

  let(:valid_attributes) { {
    one_rm_squat: 100,
    one_rm_bench_press: 90,
    one_rm_deadlift: 80,
    one_rm_overhead_press: 70,
    "start_date(1i)": 2016,
    "start_date(2i)": 9,
    "start_date(3i)": 3,
  } }

  let(:invalid_attributes) { {
    one_rm_squat: 100,
    one_rm_bench_press: 90,
    one_rm_deadlift: 80,
    "start_date(1i)": 2016,
    "start_date(2i)": 9,
    "start_date(3i)": 3,

  } }

  let(:valid_session) { {} }

  before { controller.session[:user_id] = program.user.id }

  describe "GET #index" do
    before do
      program
      get :index, params: { session: session } 
    end

    it { expect(assigns(:programs)).to eq([program])}
    it { is_expected.to render_template :index }
    it { is_expected.to respond_with :ok }
  end

  describe "GET #show" do
    before do 
      program.initialize_cycle
      get :show, params: { id: program.id }
    end

    it { expect(assigns(:program)).to eq(program) }
    it { is_expected.to redirect_to program_cycles_path program.id }
    it { is_expected.to respond_with :found }
  end

  describe "GET #new" do
    before { get :new, params: {} }
    it { expect(assigns(:program)).to be_a_new(Program) }
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, params: { program: valid_attributes }, session: valid_session }

      it { expect(assigns(:program)).to be_a(Program) }
      it { expect(assigns(:program)).to be_persisted }
      it { expect(response).to redirect_to(Program.last) }


      it { 
        get :index, params: { session: session }
        expect(assigns(:programs).count).to eq(2)
      }
    end

    context "with invalid params" do
      before { post :create, params: {program: invalid_attributes}, session: valid_session }
      it { expect(response).to render_template("new") }
    end
  end
end
