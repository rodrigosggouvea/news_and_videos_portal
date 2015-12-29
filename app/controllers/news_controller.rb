class NewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.all
  end

  def show
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.save if @news.valid?

    respond_with @news
  end

  def update
    @news.update(news_params)
    respond_with @news
  end

  def destroy
    @news.destroy
    redirect_to news_url, notice: t('helpers.destroy')
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title_pt, :title_es, :text_pt, :text_es, :user_id, :all_tags_pt, :all_tags_es)
    end
end
