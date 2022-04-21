# frozen_string_literal: true

# starting learning migrations and other things
class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(check_params)
    if @article.save
      redirect_to articles_url, notice: 'Article was created successfully'
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(check_params)
      redirect_to articles_url, notice: 'Article was updated successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: 'Article was deleted successfully'
  end

  private
  def check_params
    params.require(:article).permit(:title, :name)
  end
end
