class PlantsController < ApplicationController
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_plant
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create!(plant_params)
    render json: plant, status: :created
  end

  # UPDATE /plants/:id
  def update
    plant = find_plant
    plant.update!(plant_params)
    render json: plant
  end

  # DELETE /plants/:id
  def destroy
    plant = find_plant
    plant.destroy
    render json: {}
  end

  private

  def plant_params
    params.permit(:name, :image, :id, :is_in_stock, :price)
  end

  def find_plant
    Plant.find_by!(id: params[:id])
  end
end
