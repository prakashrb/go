class UsersController < ApplicationController
  before_action :authenticate_user!	
  
  before_action :check_admin, only: [:edit, :new, :create, :update]
  
  def index
  	@users = User.all
  end

  def show
   	@user = User.find(params[:id])
  end

  def edit 
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find params[:id]
  	@user.update_attributes(user_params)
  	save_user
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	save_user
  end

  private

  def save_user
  	roles = Role.where(id: params[:role][:id])
  	@user.roles = roles
  	@user.save
  	redirect_to @user
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def check_admin
  	redirect_to root_path unless current_user.roles.collect(&:name).include?("admin")
  end
end
