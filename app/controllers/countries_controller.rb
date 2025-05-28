class CountriesController < ApplicationController
<<<<<<< HEAD
  def index
    @countries = Country.all
  end
=======
  
  def index
    @countries = Country.all
  end
  
  def show
    @country = Country.find(params[:id])
  end
>>>>>>> 100aab71d0fe751069337deb64b08d26a67c81c3
end
