class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params[:user])
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def show;  end

  def edit
    @user = User.find(current_user.id)
    render :edit
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_create_params[:user])
    redirect_to user_path(current_user.id)
  end

  private

  def user_create_params
    params.permit(user: [:user_name, :name, :email, :password, :password_confirmation, :address, :city, :state, :zip, :card_name, :cc_exp, :cc_cvv, :billing_zip, :last_four_cc])
  end
end
