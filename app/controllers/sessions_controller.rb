class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.child
        child = user.child
        select_a_child child
        redirect_to child_path(id: user.child.id)
      else
        redirect_to new_child_url
      #redirect_to user
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
