class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    @video.save if @video.valid?

    respond_with @video
  end

  def update
    @video.update(video_params)
    respond_with @video
  end

  def destroy
    @video.destroy
    redirect_to video_url, notice: t('helpers.destroy')
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:user_id, :title_pt, :title_es, :link, :all_tags_pt, :all_tags_es)
  end
end
