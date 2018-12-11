class Api::PlacesController < ApplicationController
    before_action :set_place, only: [:show, :edit, :follow, :hashtags, :update, :destroy]

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

    # POST /api/places/hashtags
    def hashtags
      render json: @place.tag_list
    end

    # POST /api/places/search/hashtags
    def search_hashtags
      @places = Place.tagged_with(params[:tag])
      render json: @places
    end

    # POST /api/places/pagenation
    def pagenation
      @places = Place.page(params[:page]).per(PER)
      render json: @places
    end

    # POST /api/places/location
    def location
      @location = Geocoder.search(params[:name])
      render json: @location.first.coordinates
    end

    # POST /api/places/follow
    def follow
      if current_user.follows?(@place)
        render json: current_user.unfollow!(@place)
      else
        render json: current_user.follow!(@place)
      end
    end
  
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

      add_tags
      
      if @place.save
        @place.update(place_params)
        render json: @place
      else
        render json: @place.errors
      end
    end
  
    # PATCH/PUT /api/places/1
    # PATCH/PUT /api/places/1.json
    def update

      @place.tags.destroy_all

      add_tags

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
        params.require(:place).permit(:name, :content, :latitude, :longitude)
      end

      def tags_params
        params.require(:place).permit(:tags)
      end

      def add_tags
        tags = tags_params[:tags]
        tags.split(" ").each do |tag|
          @place.tag_list.add(tag)
        end
      end
  end