class CitiesController < ApplicationController

  def index
    @cities = City.all.order("id DESC").limit(4).reverse
    response = HTTParty.get("https://samples.openweathermap.org/data/2.5/group?id=3871336,3688357,3936456,3448439&units=metric&appid=b1b15e88fa797225412429c1c50c122a1", :verify => false)
    if response.success?
      @list = response["list"]
    end
  end

  def create
    list = params["list"]
    list.each do |city|
      @city = City.new
      @city.name = city["name"]
      @city.temp = city["main"]["temp"].to_i
      @city.temp_max = city["main"]["temp_max"].to_i
      @city.temp_min = city["main"]["temp_min"].to_i
      @city.save
    end
    redirect_to root_path
  end
end
