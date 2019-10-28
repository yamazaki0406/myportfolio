class MapsController < ApplicationController
  def index
    @child = Child.find(session[:child_id])
    @maps = @child.maps.paginate(page: params[:page], per_page: 5)
  end

  def new
    @child = Child.find(session[:child_id])
    @map = @child.maps.build
  end

  def show
  end

  def edit
  end
end
