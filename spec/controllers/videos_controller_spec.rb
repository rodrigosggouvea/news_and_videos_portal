require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  before(:each) do
    current_user = create :user
    sign_in current_user
  end

  let(:valid_attributes) {
    build(:video).attributes
  }

  let(:invalid_attributes) {
    build(:invalid_video).attributes
  }

  describe "GET #index" do
    it "assigns all videos as @video" do
      video = Video.create! valid_attributes
      get :index
      expect(assigns(:videos)).to eq([video])
    end
  end

  describe "GET #show" do
    it "assigns the requested video as @video" do
      video = Video.create! valid_attributes
      get :show, {:id => video.to_param}
      expect(assigns(:video)).to eq(video)
    end
  end

  describe "GET #new" do
    it "assigns a new video as @video" do
      get :new
      expect(assigns(:video)).to be_a_new(Video)
    end
  end

  describe "GET #edit" do
    it "assigns the requested video as @video" do
      video = Video.create! valid_attributes
      get :edit, {:id => video.to_param}
      expect(assigns(:video)).to eq(video)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a video Video" do
        expect {
          post :create, {:video => valid_attributes}
        }.to change(Video, :count).by(1)
      end

      it "assigns a newly created video as @video" do
        post :create, {:video => valid_attributes}
        expect(assigns(:video)).to be_a(Video)
        expect(assigns(:video)).to be_persisted
      end

      it "redirects to the created video" do
        post :create, {:video => valid_attributes}
        expect(response).to redirect_to(Video.last)
      end
    end

    context "with invalid params" do
      it "assigns a videoly created but unsaved video as @video" do
        post :create, {:video => invalid_attributes}
        expect(assigns(:video)).to be_a_new(Video)
      end

      it "re-renders the 'new' template" do
        post :create, {:video => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:video_attributes) {
        { title_pt: "NEW TEST" }
      }

      it "updates the requested video" do
        video = Video.create! valid_attributes
        put :update, {:id => video.to_param, :video => video_attributes}
        video.reload
        expect(video.title_pt).to eq(video_attributes[:title_pt])
      end

      it "assigns the requested video as @video" do
        video = Video.create! valid_attributes
        put :update, {:id => video.to_param, :video => valid_attributes}
        expect(assigns(:video)).to eq(video)
      end

      it "redirects to the video" do
        video = Video.create! valid_attributes
        put :update, {:id => video.to_param, :video => valid_attributes}
        expect(response).to redirect_to(video)
      end
    end

    context "with invalid params" do
      it "assigns the video as @video" do
        video = Video.create! valid_attributes
        put :update, {:id => video.to_param, :video => invalid_attributes}
        expect(assigns(:video)).to eq(video)
      end

      it "re-renders the 'edit' template" do
        video = Video.create! valid_attributes
        put :update, {:id => video.to_param, :video => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested video" do
      video = Video.create! valid_attributes
      expect {
        delete :destroy, {:id => video.to_param}
      }.to change(Video, :count).by(-1)
    end

    it "redirects to the video list" do
      video = Video.create! valid_attributes
      delete :destroy, {:id => video.to_param}
      expect(response).to redirect_to(video_url)
    end
  end

end
