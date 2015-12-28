require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    current_user = create :user, admin: true
    sign_in current_user
  end

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

  describe 'POST #ban' do
    it 'Bans given user' do
      user = create :user
      post :ban, id: user.to_param
      user.reload
      expect(user.banned).to eq(true)
    end
  end

  describe 'POST #set_admin' do
    it 'Sets given user as admin' do
      user = create :user
      post :set_admin, id: user.to_param
      user.reload
      expect(user.admin).to eq(true)
    end
  end

end
