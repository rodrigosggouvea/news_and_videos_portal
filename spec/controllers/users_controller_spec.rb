require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns all Users in users" do
      user = create :user
      get :index
      expect(assigns(:users)).to include(user)
    end
  end

end
