class BooksController < ApplicationController
	def top
	end
	def index
		@book = Book.new
		@books = Book.all
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
		@book_find = Book.find(params[:id])
		@book = Book.new
		@books = Book.all
	end
	def edit
        @book_edit = Book.find(params[:id])
        @book = Book.new
    end
    def update
    	book = Book.find(params[:id])
        book.update(book_params)
        if book.update(book_params)
        flash[:notice] = "successfully"
        redirect_to book_path(book.id)
    end
    end
    def destroy
    	book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end
    def about

    end

	private

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
