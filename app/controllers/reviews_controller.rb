class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
      @travel = Travel.find(params[:travel_id])
      @review = @travel.reviews.build(review_params)
      @review.user = current_user

      if @review.save
        redirect_to @travel, notice: 'Отзыв успешно добавлен.'
      else
        render 'travels/show'
      end
  end
  def index
    @review= Review.all
  end
  def show
    @review = Review.find(params[:id])
  end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path, notice: 'Отзыв успешно удален.'
  end
  def edit
    @review = Review.find(params[:id])
  end


  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
