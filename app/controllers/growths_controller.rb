# frozen_string_literal: true

class GrowthsController < ApplicationController
  before_action :logged_in_user, except: %i[index detail]
  before_action :making_user, only: :destroy

  def index
    @child = Child.find(session[:child_id])
    gon.growth = @child.growths.count
    gon.date = @child.growths.pluck(:date)
    gon.height = @child.growths.pluck(:height)
    gon.weight = @child.growths.pluck(:weight)
  end

  def new
    @child = Child.find(session[:child_id])
    @growth = Growth.new
  end

  def create
    @child = Child.find(session[:child_id])
    @growth = @child.growths.build(growth_params)
    if @growth.save
      flash[:success] = '登録が完了しました！'
      redirect_to growths_url
    else
      render 'new'
    end
  end

  def detail
    @child = Child.find(session[:child_id])
    @growths = @child.growths
  end

  def edit
    @child = Child.find(session[:child_id])
    @growth = Growth.find(params[:id])
  end

  def update
    @child = Child.find(session[:child_id])
    @growth = Growth.find(params[:id])
    if @growth.update_attributes(growth_params)
      flash[:success] = '更新が完了しました！'
      redirect_to growths_url
    else
      render 'edit'
    end
  end

  def destroy
    Growth.find(params[:id]).destroy
    flash[:success] = '削除しました。'
    redirect_to growths_url
  end

  private

  def growth_params
    params.require(:growth).permit(:date, :height, :weight, :child_id, :user_id)
  end

  def making_user
    @current_user_id = session[:user_id]
    growth = Growth.find(params[:id])
    @making_user_id = growth.user_id
    redirect_to detail_growth_url if @current_user_id != @making_user_id
  end
end
