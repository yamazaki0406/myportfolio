class FamilysController < ApplicationController
  before_action :parent_user, only: :show

  def index
    @user = User.find(session[:user_id])
    @children = @user.children
  end

  def new
  end

  def create
    @user = User.find(family_params[:user_id])
    if Child.where(name: family_params[:child_name]).where(id: family_params[:child_id]).presence
      @child = Child.find(family_params[:child_id])
      if @child.child_password == family_params[:child_password]
        @user.children << @child
        flash[:success] = "別の保護者の方から子どもを共有しました！"
        redirect_to @child
      else
        flash[:danger] = "子どもの名前もしくはIDに誤りがあります！"
        render "new"
      end
    else
      flash[:danger] = "パスワードに誤りがあります！"
      render "new"
    end
  end

  def show
    @child = Child.find(params[:id])
    @child_password = @child.child_password
  end

  private
   def family_params
     params.require(:family).permit(:child_id, :child_name, :child_password, :user_id)
   end

   def parent_user
     @current_user_id = session[:user_id]
     @child_id = Child.find(params[:id])
     unless Family.where(user_id: @current_user_id).where(child_id: @child_id).presence
       redirect_to login_url
     end
   end

end
