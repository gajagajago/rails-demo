class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @user = User.order('id DESC').paginate(page: params[:page], per_page: 8)
  end

  def show
    @article = @user.articles.order('id DESC').paginate(page: params[:page], per_page: 6)
  end

  def new
    @user = User.new
  end

  def create
    if @current_user
      return
    end

    @user = User.new(user_params)
    if (@user.save)
      flash[:notice] = "유저: #{@user.name} 님이 생성되었습니다!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "유저: #{@user.name} 님의 정보가 수정되었습니다!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !admin?
      flash[:alert] = "해당 유저가 아닙니다"
      redirect_to @user
    end
  end
end
