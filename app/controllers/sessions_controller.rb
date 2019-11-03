# frozen_string_literal: true

class SessionsController < ApplicationController
  layout 'headerless_layout'

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.children.count != 0
        child = user.children.first
        select_child child
        redirect_to child_path(session[:child_id])
      else
        redirect_to new_child_url
      end
    else
      flash.now[:danger] = 'アドレス・パスワードに過りがあります。'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    release_child
    redirect_to root_url
  end
end
