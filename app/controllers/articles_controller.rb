class ArticlesController < ApplicationController
  respond_to :html, :json

  def new
    @article = encyclopedia.new_article
  end

  def create
    @article = encyclopedia.new_article(article_params)
    if @article.publish
      redirect_to root_path, notice: 'Article added!'
    else
      render 'new'
    end
  end

  def show
  end

  private

  attr_reader :article
  helper_method :article

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
