##
# Controller for returning articles as JSON
class Api::V1::ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.all
  end


  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end
end
