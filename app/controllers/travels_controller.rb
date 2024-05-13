class TravelsController < ApplicationController
  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)

    if @travel.save
      redirect_to root_path, notice: 'Travel успешно создан.'
    end
  end
  def index
    @travel= Travel.all
  end

  def show
    @travel = Travel.find(params[:id])
    @reviews = @travel.reviews
  end

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy
    redirect_to root_path, notice: 'Travel успешно удален.'
  end
  def edit
    @travel = Travel.find(params[:id])
  end
  def update
    @travel = Travel.find(params[:id])

    if @travel.update(travel_params)
      redirect_to root_path, notice: 'Данные travel обновлены.'
    end
  end
  def filter

  end

  def random
    # Пример обработки параметров фильтрации
    climate_filter = params[:climate] || []
    location_filter = params[:location] || []
    popularity_filter = params[:popularity] || []

    # Применение фильтров к модели Travel
    travels = Travel.all
    travels = apply_climate_filter(travels, climate_filter)
    travels = apply_location_filter(travels, location_filter)
    travels = apply_popularity_filter(travels, popularity_filter)

    # Выбор случайной записи из отфильтрованного списка
    redirect_to travels.sample

    # Перенаправление на страницу с выбранной записью
  end

  def add_to_favorites
    @travel = Travel.find(params[:id])
    current_user.travels << @travel
    redirect_to @travel, notice: 'Успешно добавлено в избранное.'
  end

  private

  def apply_climate_filter(travels, climate_filter)
    # Пример применения фильтра климата
    if climate_filter.include?("hot")
      travels = travels.where(climate: "Жарко")
    elsif climate_filter.include?("warm")
      travels = travels.where(climate: "Тепло")
    elsif climate_filter.include?("cold")
      travels = travels.where(climate: "Холодно")
    end
    travels
  end

  def apply_location_filter(travels, location_filter)
    # Пример применения фильтра расположения
    if location_filter.include?("by_sea")
      travels = travels.where(iswater: 1)
    elsif location_filter.include?("by_mountain")
      travels = travels.where(ismount: 1)
    end
    travels
  end

  def apply_popularity_filter(travels, popularity_filter)
    # Пример применения фильтра популярности
    if popularity_filter.include?("popular")
      travels = travels.where(ispopular: 1)
    elsif popularity_filter.include?("not_popular")
      travels = travels.where(ispopular: 0)
    end
    travels
  end


  def travel_params
    params.require(:travel).permit(
      :country, :city, :climate, :iswater, :ismount, :ispopular, :description, :city_image
    )
  end
end
