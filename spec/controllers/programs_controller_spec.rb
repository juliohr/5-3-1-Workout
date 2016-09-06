require 'rails_helper'
RSpec.describe ProgramsController, type: :controller do

  let(:program) { FactoryGirl.create(:program) }
  let(:program_2) { FactoryGirl.create(:program) }

  let(:invalid_program) { FactoryGirl.create(:program, person_name: nil) }

  let(:valid_attributes) { {
    person_name: "John Doe",
    one_rm_squat: 100,
    one_rm_bench_press: 90,
    one_rm_deadlift: 80,
    one_rm_overhead_press: 70,
    "start_date(1i)": 2016,
    "start_date(2i)": 9,
    "start_date(3i)": 3,
  } }

  let(:invalid_attributes) { {
    person_name: "John Doe",
    one_rm_squat: 100,
    one_rm_bench_press: 90,
    one_rm_deadlift: 80,
    "start_date(1i)": 2016,
    "start_date(2i)": 9,
    "start_date(3i)": 3,

  } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all programs as @programs" do
      program
      get :index
      expect(assigns(:programs)).to eq([program])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before { program.initialize_cycle }
    it "assigns the requested program as @program" do
      get :show, params: {id: program.id}
      expect(assigns(:program)).to eq(program)
    end

    it "renders the :show view" do
      get :show, params: {id: program.id}
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new program as @program" do
      get :new, params: {}
      expect(assigns(:program)).to be_a_new(Program)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Program" do
        expect {
          post :create, params: {program: valid_attributes}
        }.to change(Program, :count).by(1)
      end

      it "assigns a newly created program as @program" do
        post :create, params: {program: valid_attributes}
        expect(assigns(:program)).to be_a(Program)
        expect(assigns(:program)).to be_persisted
      end

      it "redirects to the created program" do
        post :create, params: {program: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Program.last)
      end
    end

    context "with invalid params" do
      it "re-renders the 'new' template" do
        post :create, params: {program: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested program" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, program: new_attributes}, session: valid_session
        program.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested program as @program" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, program: valid_attributes}, session: valid_session
        expect(assigns(:program)).to eq(program)
      end

      it "redirects to the program" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, program: valid_attributes}, session: valid_session
        expect(response).to redirect_to(program)
      end
    end

    context "with invalid params" do
      it "assigns the program as @program" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, program: invalid_attributes}, session: valid_session
        expect(assigns(:program)).to eq(program)
      end

      it "re-renders the 'edit' template" do
        program = Program.create! valid_attributes
        put :update, params: {id: program.to_param, program: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested program" do
      program = Program.create! valid_attributes
      expect {
        delete :destroy, params: {id: program.to_param}, session: valid_session
      }.to change(Program, :count).by(-1)
    end

    it "redirects to the programs list" do
      program = Program.create! valid_attributes
      delete :destroy, params: {id: program.to_param}, session: valid_session
      expect(response).to redirect_to(programs_url)
    end
  end

end
