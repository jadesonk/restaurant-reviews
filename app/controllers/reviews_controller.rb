class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new # prepare the form for an emtpy review instance

    # link @review -> @restaurant
    # @review.restaurant_id = params[:restaurant_id] # => dont need this
    @review.restaurant = @restaurant
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      # redirect_to restaurant_path(restaurant)
      redirect_to @restaurant
    else
      # redirect_to new_restaurant_review_path
      render :new # need to find syntax for how to redirect to show page
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
