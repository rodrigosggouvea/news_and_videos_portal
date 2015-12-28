require 'rails_helper'

RSpec.describe NewsController, type: :controller do

  before(:each) do
    current_user = create :user
    sign_in current_user
  end

  let(:valid_attributes) {
    build(:news).attributes
  }

  let(:invalid_attributes) {
    build(:invalid_news).attributes
  }

  describe "GET #index" do
    it "assigns all news as @news" do
      new = News.create! valid_attributes
      get :index
      expect(assigns(:news)).to eq([new])
    end
  end

  describe "GET #show" do
    it "assigns the requested new as @new" do
      new = News.create! valid_attributes
      get :show, {:id => new.to_param}
      expect(assigns(:news)).to eq(new)
    end
  end

  describe "GET #new" do
    it "assigns a new new as @new" do
      get :new
      expect(assigns(:news)).to be_a_new(News)
    end
  end

  describe "GET #edit" do
    it "assigns the requested new as @new" do
      new = News.create! valid_attributes
      get :edit, {:id => new.to_param}
      expect(assigns(:news)).to eq(new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new News" do
        expect {
          post :create, {:news => valid_attributes}
        }.to change(News, :count).by(1)
      end

      it "assigns a newly created new as @new" do
        post :create, {:news => valid_attributes}
        expect(assigns(:news)).to be_a(News)
        expect(assigns(:news)).to be_persisted
      end

      it "redirects to the created new" do
        post :create, {:news => valid_attributes}
        expect(response).to redirect_to(News.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved new as @new" do
        post :create, {:news => invalid_attributes}
        expect(assigns(:news)).to be_a_new(News)
      end

      it "re-renders the 'new' template" do
        post :create, {:news => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:news_attributes) {
        { title_pt: "NEW TEST" }
      }

      it "updates the requested new" do
        new = News.create! valid_attributes
        put :update, {:id => new.to_param, :news => news_attributes}
        new.reload
        expect(new.title_pt).to eq(news_attributes[:title_pt])
      end

      it "assigns the requested new as @new" do
        new = News.create! valid_attributes
        put :update, {:id => new.to_param, :news => valid_attributes}
        expect(assigns(:news)).to eq(new)
      end

      it "redirects to the new" do
        new = News.create! valid_attributes
        put :update, {:id => new.to_param, :news => valid_attributes}
        expect(response).to redirect_to(new)
      end
    end

    context "with invalid params" do
      it "assigns the new as @new" do
        new = News.create! valid_attributes
        put :update, {:id => new.to_param, :news => invalid_attributes}
        expect(assigns(:news)).to eq(new)
      end

      it "re-renders the 'edit' template" do
        new = News.create! valid_attributes
        put :update, {:id => new.to_param, :news => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested new" do
      new = News.create! valid_attributes
      expect {
        delete :destroy, {:id => new.to_param}
      }.to change(News, :count).by(-1)
    end

    it "redirects to the news list" do
      new = News.create! valid_attributes
      delete :destroy, {:id => new.to_param}
      expect(response).to redirect_to(news_url)
    end
  end

end
