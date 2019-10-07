# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def select_a_child(child)
    session.delete(:child_id) unless session[:child_id].nil?
    session[:child_id] = child.id
    # もし、子どものセッションを持っていたらセッションを切る
    # paramsに入っているセッションを追加する
    # 新しく入っているセッションにリダイレクトする
  end

  def change_a_child; end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def release_a_child
    session.delete(:child_id)
  end
end
