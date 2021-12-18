class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    set_article
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    if  @article.save
      flash[:notice] = "ARTICLEの作成に成功しました"
      redirect_to @article
    else
      render "new"
    end

  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    set_article
    if @article.update(article_params)
      flash[:notice] = "ARTICLEの変更を保存しました"
      redirect_to @article
    else 
      render "edit"
    end

  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    set_article
    @article.destroy
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
