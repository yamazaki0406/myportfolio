class MapsController < ApplicationController
  def index
    @child = Child.find(session[:child_id])
    @maps = @child.maps.paginate(page: params[:page], per_page: 5)
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
      flash[:success] = '記事の登録が完了しました！'
      redirect_to maps_url
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  private

  def map_params
    params.require(:map).permit(:content, :user_id, :child_id, :longitude, :latitude)
  end

end
