class HomesController < ApplicationController

  def index
    if user_signed_in?
      @recipes = Recipe.includes([:favorites], [:user]).page(params[:page]).limit(3)
    end
      @recipes = Recipe.includes([:user]).page(params[:page]).limit(3)
  end

  def tweet_index
    @title = "タイムライン"
    @tweet = current_user.feed.includes([:user], [:favorites], [:comments], [:tags]).page(params[:page]).per(6)
  end

end
