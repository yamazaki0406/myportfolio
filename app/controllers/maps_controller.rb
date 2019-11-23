# frozen_string_literal: true

class MapsController < ApplicationController
  def index
    @child = Child.find(session[:child_id])
    @maps = @child.maps
    gon.max_latitude = @maps.pluck(:latitude).max
    gon.min_latitude = @maps.pluck(:latitude).min
    gon.max_longitude = @maps.pluck(:longitude).max
    gon.min_longitude = @maps.pluck(:longitude).min
    render layout: 'showing_index_map'
  end

  def new
    @child = Child.find(session[:child_id])
    @map = @child.maps.build
    render layout: 'creating_new_map'
  end

  def create
    @child = Child.find(session[:child_id])
    @map = @child.maps.build(map_params)
    if @map.save
      redirect_to maps_url
      flash[:success] = '思い出の場所を追加しました！'
    else
      redirect_to new_map_url
    end
  end

  def show; end

  def edit; end

  private

  def map_params
    params.require(:map).permit(:content, :user_id, :child_id, :longitude, :latitude)
  end
end
