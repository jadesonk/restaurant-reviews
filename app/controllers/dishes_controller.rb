class DishesController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = Dish.new # prepare form for empty dish isntance

    # link the dish to the restaurant
    @dish.restaurant = @restaurant
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    new_dish = Dish.new(dish_params)
    # connect the new dish with the restaurant
    new_dish.restaurant = @restaurant
    if new_dish.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name)
  end
end
