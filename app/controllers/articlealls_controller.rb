class ArticleallsController < ApplicationController

    def index

      @article_categories = ArticleCategory.all
      @articles = Article.where(:is_hidden => false).order("created_at DESC")
    end

end
