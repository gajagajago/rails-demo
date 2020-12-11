class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))

    if (@user.save)
      flash[:notice] = "유저: #{params.require(:user).require(:name)} 님이 생성되었습니다!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params.require(:user).permit(:name, :email, :password))
      flash[:notice] = "유저: #{params.require(:user).require(:name)} 님의 정보가 수정되었습니다!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end
end
