# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user
      log_in @user
      flash.now[:success] = 'Success'
      redirect_to @user
    else
      flash.now[:danger] = 'Email does not exist!'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
