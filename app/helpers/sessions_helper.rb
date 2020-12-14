module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # (1)
    # if @current_user.nil?
    #   @current_user = User.find_by(id: session[:user_id])
    # else
    #   @current_user = @current_user
    # end
    # (2)
    # @current_user = @current_user || User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !!current_user
  end

  def require_user
    if !user_signed_in?
      flash[:alert] = "로그인 해주세요"
      redirect_to login_path
    end
  end

  def admin?
    user_signed_in? && current_user.admin?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
