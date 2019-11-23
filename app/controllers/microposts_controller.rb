# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :logged_in_user, except: %i[index show]
  before_action :making_user, only: :destroy

  def index
    @child = Child.find(session[:child_id])
    @microposts = @child.microposts.paginate(page: params[:page], per_page: 5)
  end

  def new
    @child = Child.find(session[:child_id])
    @micropost = @child.microposts.build
    @map = @child.maps.build
    render layout: 'creating_new_map'
  end

  def create
    @child = Child.find(session[:child_id])
    @micropost = @child.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = '記事の登録が完了しました！'
      redirect_to microposts_url
    else
      render 'new'
    end
  end

  def edit
    @child = Child.find(session[:child_id])
    @micropost = Micropost.find(params[:id])
  end

  def update
    @child = Child.find(session[:child_id])
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = '記事の編集が完了しました！'
      redirect_to microposts_url
    else
      render 'edit'
    end
  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = '記事を削除しました！'
    redirect_to microposts_url
  end

  def purge
    Micropost.find(params[:id]).images.purge
    flash[:success] = '画像を削除しました'
    redirect_to edit_micropost_url(params[:id])
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :user_id, images: [])
  end

  def making_user
    @current_user_id = session[:user_id]
    micropost = Micropost.find(params[:id])
    @making_user_id = micropost.user_id
    redirect_to microposts_url if @current_user_id != @making_user_id
  end
end
