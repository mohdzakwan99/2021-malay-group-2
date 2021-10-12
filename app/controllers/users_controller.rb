class UsersController < ApplicationController
 before_action :logged_in_user, except: %i(new show create)
 before_action :correct_user, only: %i(edit, update)
 before_action :admin_user, only: :destroy
 skip_before_action :verify_authenticity_token

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @current_user = current_user
    @user = User.find_by id: params[:id]
    @user_pending = UserCourse.Pending.all
    @user_approved = UserCourse.Approved.all
    @user_denied = UserCourse.Denied.all
    @user_course = UserCourse.find_by user_id: params[current_user]
    return if @user
    flash[:danger] = t(:user_x_found)
    redirect_to home_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)  # Not the final implementation!
    if @user.save
      @user.send_activation_email
      flash[:info] = t(:check)
      redirect_to home_url
    else
      render :new
    end
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:success] = t(:profile_updated)
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user&.destroy
      flash[:success] = t(:user_deleted)
    else
      flash[:danger] = t(:delete_fail)
    end
    redirect_to users_path
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t(:pls_log_in)
      redirect_to login_url
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    return if current_user?(@user)
    flash[:danger] = t(:n_authorized)
    redirect_to(home_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(home_url) unless current_user.admin?
  end
end
