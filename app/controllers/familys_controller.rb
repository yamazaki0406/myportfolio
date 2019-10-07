# frozen_string_literal: true

class FamilysController < ApplicationController
  before_action :parent_user, only: :show
  before_action :address_blank_check, only: :share

  def index
    @user = User.find(session[:user_id])
    @children = @user.children
  end

  def new
    render layout: 'top_page'
  end

  def create
    @user = User.find(family_params[:user_id])
    if Child.where(name: family_params[:child_name])
            .where(id: family_params[:child_id]).presence
      @child = Child.find(family_params[:child_id])
      if @child.child_password == family_params[:child_password]
        @user.children << @child
        flash[:success] = '別の保護者の方から子どもを共有しました！'
        redirect_to @child
      else
        flash[:danger] = '子どもの名前もしくはIDに誤りがあります！'
        render 'new', layout: 'top_page'
      end
    else
      flash[:danger] = 'パスワードに誤りがあります！'
      render 'new', layout: 'top_page'
    end
  end

  def show
    @child = Child.find(params[:id])
  end

  def share
    UserMailer.share_child(session[:user_id],
                           params[:id],
                           params[:address]).deliver_now
    flash[:success] = 'メールを送信しました'
    redirect_to familys_url
  end

  private

  def family_params
    params.require(:family).permit(:child_id,
                                   :child_name,
                                   :child_password,
                                   :user_id,
                                   :address)
  end

  def parent_user
    @current_user_id = session[:user_id]
    @child_id = Child.find(params[:id])
    return if Family.where(user_id: @current_user_id)
                    .where(child_id: @child_id).presence

    redirect_to login_url
  end

  def address_blank_check
    return if params[:address].presence

    flash.now[:danger] = 'アドレスが空欄になっています！'
    @child = Child.find(params[:id])
    render 'show'
  end
end
