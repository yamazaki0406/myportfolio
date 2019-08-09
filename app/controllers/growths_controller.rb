class GrowthsController < ApplicationController

  def index
    @child = Child.find(session[:child_id])
    @growths = @child.growths
  end

  def new
    @child = Child.find(session[:child_id])
    @growth = Growth.new
  end

  def create
    @child = Child.find(session[:child_id])
    @growth = @child.growths.build(growth_params)
    if @growth.save
      #login user(session[:user_id] = user.idを付与)
      flash[:success] = "Create New growth!!"
      redirect_to growths_url
    else
      render "new"
    end
  end


  def show #自分の子どものデータの一覧を抽出
  end

  def edit
    @child = Child.find(session[:child_id])
    @growth = Growth.find(params[:id])
  end

  def update
    @child = Child.find(session[:child_id])
    @growth = Growth.find(params[:id])
    if @growth.update_attributes(growth_params)
      flash[:success] = "Growth updated"
      redirect_to growths_url
    else
      render "edit"
    end
  end

  def destroy
   Growth.find(params[:id]).destroy
   flash[:success] = "User deleted"
   redirect_to growths_url
  end

  private
  def growth_params
    params.require(:growth).permit(:date, :height, :weight, :child_id)
  end

end
