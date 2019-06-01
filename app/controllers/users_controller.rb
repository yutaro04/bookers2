class UsersController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  def show
  	@user = User.find(params[:id])
    @user.books
    @book = Book.new
    @book.user_id = current_user.id
  end
  def edit
  	 @user_edit = User.find(params[:id])
  end
  def update
      user = User.find(current_user.id)
      if user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to books_path(user.id)
  end
  end
  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
