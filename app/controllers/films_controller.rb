class FilmsController < ApplicationController
  before_action :set_film, only: %i[ show edit update destroy ]

  def index
    if params[:search]
      @films = Film.search(params[:search]).sort_by(&:rating).reverse
    else
      @films = Film.all.sort_by(&:rating).reverse
    end

    if params[:sort]
      @films = @films.sort_by(&:year) if params[:sort] == 'by_year'
      @films = @films.sort_by(&:genre) if params[:sort] == 'by_genre'
      @films = @films.sort_by(&:company) if params[:sort] == 'by_company'
      @films = @films.sort_by(&:producer) if params[:sort] == 'by_producer'
      @films.reverse! if params[:desc] == '1'
    end
  end

  def show
    @comments = @film.comments
    @rating = @film.ratings.where(user_id: current_user.id).first&.value if current_user
  end

  def new
    @film = Film.new
  end

  def edit; end

  def create
    @film = Film.new(film_params)

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: "Фильм был успешно создан." }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: "Фильм был успешно обновлён." }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: "Фильм был успешно удалён." }
      format.json { head :no_content }
    end
  end

  private
    def set_film
      @film = Film.find(params[:id])
    end

    def film_params
      params.require(:film).permit(:title, :year, :genre, :company, :producer, :actors, :cost, :image_link, :rating)
    end
end
