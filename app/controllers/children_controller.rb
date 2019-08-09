class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      #login user(session[:user_id] = user.idを付与)
      flash[:success] = "Create New Child!!"
      select_a_child @child
      redirect_to @child
    else
      render "new"
    end
  end

  def show
    @child = Child.find(params[:id])
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    if @child.update_attributes(child_params)
      flash[:success] = "Profilre updated"
      redirect_to @child
    else
      render "edit"
    end
  end

 private
 def child_params
   params.require(:child).permit(:name, :sex, :birthday, :user_id)
 end
end
