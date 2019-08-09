class MicropostsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_child,   only: :destroy

  def index
    @child = Child.find(session[:child_id])
    @microposts = @child.microposts
  end

  def new
    @child = Child.find(session[:child_id])
    @micropost = @child.microposts.build
  end

  def create
    @child = Child.find(session[:child_id])
    @micropost = @child.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to microposts_url
    else
      render "new"
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
      flash[:success] = "Growth updated"
      redirect_to microposts_url
    else
      render "edit"
    end
  end

  def destroy
   Micropost.find(params[:id]).destroy
   flash[:success] = "User deleted"
   redirect_to microposts_url
  end

 private
 def micropost_params
   params.require(:micropost).permit(:content)
 end

 def correct_child
   @child = Child.find(session[:child_id])
   @micropost = @child.microposts.find_by(id: params[:id])
   redirect_to microposts_url if @micropost.nil?
 end

end
