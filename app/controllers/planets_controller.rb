class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[ show update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  # GET /planets
  def index
    planets = Planet.all

    render json: planets
  end
  def show 
    planet  = Planet.find(params[:id])
    render json: planet
  end
  def create
    planet = Planet.create!(planet_params)
    render json: planet, status: :created
  end
  def update
    planet = Planet.find(params[:id])
    planet.update(planet_params)
    render json: planet
  end
  def destroy
    planet = Planet.find(params[:id])
    planet.destroy
    head :no_content
  end

  private

  def planet_params
    params.permit(:name, :distance_from_earth, :nearest_star, :image)
  end
  def render_not_found_response
    render json: { error: "Planet not found" }, status: :not_found
  end
end
