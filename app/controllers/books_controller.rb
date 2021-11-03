class BooksController < ApplicationController
  # before_action :allbooks, except: [:show, :create, :update, :edit, :destroy]
  # before_action :book, only: [:show, :destroy, :update, :edit]
  before_action :authenticate_user!
  before_action :check_auth
  before_action :set_authors_and_genres, only: [:new, :edit, :create]
  before_action :set_book, only: [:update, :edit, :show, :destroy]

  def new
    @book = Book.new
  end

  def index
      case params[:query]
      when "in_stock"
        @books = Book.in_stock
      when "out_of_stock"
        @books = Book.out_of_stock
      when "banned"
        @books = Book.banned
      else 
        @books = Book.order(title: :asc)
    end
  end

  def create
    @book = Book.new(book_params)
    begin
      @book.save!
      redirect_to book_path(@book.id)
    rescue
      # render json: @book.errors.full_messages
      # flash.now[:errors] = @book.errors.full_messages
      flash.now[:errors] = @book.errors.messages.values.flatten
      render 'new'
    end
  end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  def edit
  end

  def destroy
    @book.destroy
      redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def allbooks
    @books = Book.order(title: :asc)
  end

  def book
    
  end

  def book_params
    params.require(:book).permit(:title, :publisher, :date_published, :author_id, :cover, genre_ids: [])
  end

  def set_authors_and_genres
      @authors = Author.order(:last_name)
      @genres = Genre.order(:name)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def check_auth
    authorize Book
  end

end
