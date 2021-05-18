class RatingsController < ApplicationController

  def create
    @rating = Rating.new(rating_params)
    film = Film.find(@rating.film_id)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to film, notice: "Ваш рейтинг был успешно добавлен." }
        format.json { render json: @rating.id, status: :created }
      else
        format.html { redirect_to film, notice: @rating.errors }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def rating_params
      params.permit(:value, :user_id, :film_id)
    end

end
