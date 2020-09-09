class DishesController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = Dish.new # prepare form for empty dish isntance

    # link the dish to the restaurant
    @dish.restaurant = @restaurant
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = Dish.new(dish_params)
    # connect the new dish with the restaurant
    @dish.restaurant = @restaurant
    if @dish.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to restaurant_path(@dish.restaurant)
  end

  private

  def dish_params
    params.require(:dish).permit(:name)
  end
end
