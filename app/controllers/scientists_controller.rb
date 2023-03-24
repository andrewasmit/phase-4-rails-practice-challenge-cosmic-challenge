class ScientistsController < ApplicationController
# rescue_from ActiveRecord::InvalidRecord, with: :render_unprocessable_entity_response
# rescue_from ActiveRecord::RecordNotFound with: :render_not_found_response
    before_action :one_scientist, only: [:show, :update, :destroy]


    def index
        render json: Scientist.all
    end

    def show
        render json: @scientist, serializer: ScientistPlanetSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        @scientist.update!(scientist_params)
        render json: @scientist, status: :accepted
    end

    def destroy
        @scientist.destroy
        head :no_content
    end

    private

    def one_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    # def scientist_params_update
    #     params.permit(:name, :field_of_study, :avatar)
    # end

    # def render_unprocessable_entity_response
    #     render json: { errors: "validation errors" }, status: :unprocessable_entity 
    # end

    # def render_not_found_response
    #     render json: { errors: "not found" }, status: :not_found 
    # end

end
