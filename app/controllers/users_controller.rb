class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @book = Book.new
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @new_books = @user.books
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
