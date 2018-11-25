class Api::PlacesController < ApplicationController
    before_action :set_place, only: [:show, :edit, :update, :destroy]

    # Pagenation Content Num
    PER = 20
  
    # GET /api/places
    # GET /api/places.json
    def index
      @places = Place.all
      render json: @places
    end

    # POST /api/places/search
    def search
      @q = Place.ransack(params[:q])
      @places = @q.result
      render json: @places
    end

    # POST /api/places/pagenation
    def pagenation
      @places = Place.page(params[:page]).per(PER)
      render json: @places
    end
    # POST /api/places/search
  
    # GET /api/places/1
    # GET /api/places/1.json
    def show
      render json: @place
    end
  
    # GET /api/places/new
    def new
      @place = Place.new
      render json: @place
    end
  
    # GET /api/places/1/edit
    def edit
      render json: @place
    end
  
    # POST /api/places
    # POST /api/places.json
    def create
      @place = Place.new(place_params)
      
      if @place.save
        render json: @place
      else
        render json: @place.errors
      end
    end
  
    # PATCH/PUT /api/places/1
    # PATCH/PUT /api/places/1.json
    def update
      if @place.update(place_params)
        render json: @place
      else
        render json: @place.errors
      end
    end
  
    # DELETE /api/places/1
    # DELETE /api/places/1.json
    def destroy
      render json: @place.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_place
        @place = Place.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def place_params
        params.require(:place).permit(:name, :content)
      end
  end