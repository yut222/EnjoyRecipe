class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :destroy, :inventories]
  # before_action :set_user, except: [:index, :restore_mail, :restoration]
  before_action :withdrawal_forbid_guest_user, only: [:unsubscribe, :withdrawal]
  before_action :withdrawal_forbit_other_user, only: [:unsubscribe, :withdrawal]

  def index
    @users = User.includes(:recipes).page(params[:page]).per(6).order(id: :ASC)
  end

  def show
    @title = "#{@user.name}さんのページ"
    if user_signed_in?
      @recipes = @user.recipes.includes([:favorites]).page(params[:page]).per(6)
    else
      @recipes = @user.recipes.page(params[:page]).per(6)
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, success: "「#{@user.name}を削除しました」"
  end

  def following
    @title = "#{@user.name}さんがフォロー中"
    @message = "まだ誰もフォローしていません。"
    @users = @user.following.includes(:recipes).page(params[:page]).per(6)
    render 'show_follow'
  end

  def followers
    @title = "#{@user.name}さんのフォロワー"
    @message = "まだ誰からもフォローされていません。"
    @users = @user.followers.includes(:recipes).page(params[:page]).per(6)
    render 'show_follow'
  end

  def favorites
    @title = "#{@user.name}さんがいいねしたレシピ"
    @recipes = @user.favorite_recipes.includes([:user], [:favorites]).page(params[:page]).per(6)
    render 'show_favorite'
  end

  def inventories
    if user_signed_in? && @user.id == current_user.id
      @title = "食材管理"
      @inventories = @user.inventories.page(params[:page]).order(expiration_date: 'ASC').per(6)
      render 'show_inventory'
    else
      flash[:alert] = "他人の食材管理ページ閲覧及び編集はできません。"
      redirect_to root_path
    end
  end

  def withdrawal
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました。"
    redirect_to new_user_session_path
  end

    private

  def set_user
    @user = User.find(params[:id])
  end

  def withdrawal_forbid_guest_user
    if @user.email == "guest@example.com"
      flash[:alert] = "ゲストユーザーの退会処理はできません。"
      redirect_to root_path
    end
  end

  def withdrawal_forbit_other_user
    if current_user.email != @user.email
      flash[:alert] = "他の方の退会処理はできません。"
      redirect_to root_path
    end
  end
end
