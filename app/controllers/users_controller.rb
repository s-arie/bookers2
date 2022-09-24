class UsersController < ApplicationController

  def index
    @newbook = Book.new
    @user = current_user
    @users = User.all
    @book = @user.books
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
       redirect_to user_path(current_user.id)
    end
  end

  def update
    @user =  User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    else
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(current_user.id)
      end
    end
  end


private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
