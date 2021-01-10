class BooksController < ApplicationController
  def top
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all 
      render ("books/index")
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    if book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      render ("books/edit")
    end
  
end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end