class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      flash[:notice] = "안녕하세요 #{user.name}님 !"
      log_in user
      redirect_to articles_path
    elsif !user
      flash.now[:alert] = "이메일을 확인해주세요"
      render 'new'
    else !user.authenticate(user_params[:password])
      flash.now[:alert] = "비밀번호를 확인해주세요"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = "로그아웃 되었습니다"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:session).permit(:email, :password)
  end
end
