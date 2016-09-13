require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:user_params) {{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(6)
  }}

  let (:invalid_user_params) {{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Internet.password(6)
  }}

  describe "POST #create" do
    context "with valid params" do
      before { post :create, params: { user: user_params } }

      it { expect(User.all.count).to eq(1) }
      it { is_expected.to redirect_to :root }
      it { is_expected.to respond_with :found }
    end

    context "with invalid params" do
      before { post :create, params: { user: invalid_user_params } }
      it { expect(User.all.count).to eq(0) }
      it { is_expected.to redirect_to '/signup' }
      it { is_expected.to respond_with :found }
    end

    context "with already existed email" do
      before { post :create, params: { user: user_params } }
      before { post :create, params: { user: user_params } }

      it { expect(User.all.count).to eq(1) }
      it { is_expected.to redirect_to '/signup' }
      it { is_expected.to respond_with :found }
    end
  end
end
