class ChildrenController < ApplicationController
  def new
    @child = Child.new
    @child_password = (0..6).map{(65 + rand(26)).chr}.join
  end

  def create
    @child = Child.new(child_params)
    @user = User.find(session[:user_id])
    if @child.save
      @user.children << @child
      flash[:success] = "子どもの登録が完了しました！"
      select_a_child @child
      redirect_to @child
    else
      render "new"
    end
  end

  def show
    @child = Child.find(params[:id])
    @birthday = @child.birthday
    date_format = "%Y%m%d"
    birthday = @birthday.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    select_a_child(@child)
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    if @child.update_attributes(child_params)
      flash[:success] = "登録情報を更新しました！"
      redirect_to @child
    else
      render "edit"
    end
  end

  def destroy
   Child.find(params[:id]).destroy
   flash[:success] = "子どものデータを削除しました"
   session[:child_id] = User.find(session[:user_id]).children.first
   redirect_to user_url(session[:user_id])
  end

  def purge
   Child.find(params[:id]).images.purge
   flash[:success] = "子どもの画像を削除しました"
   redirect_to edit_child_url(session[:child_id])
  end

 private
 def child_params
   params.require(:child).permit(:name, :sex, :birthday, :user_id, :child_password, images: [])
 end
end
