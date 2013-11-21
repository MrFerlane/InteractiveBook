class HomeController < ApplicationController
  skip_filter :validate_session

  def index
    @books = Book.all
  end
end