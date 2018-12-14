class Api::PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :hashtags, :update, :destroy]
    before_action :set_post_with_place, only: [:index, :pagenation]

    # Pagenation Content Num
    PER = 20
  
    # GET /api/posts
    # GET /api/posts.json
    def index
      render json: @posts
    end

    # POST /api/posts/search
    def search
      @q = Post.ransack(params[:q])
      @posts = @q.result
      render json: @posts
    end

    # POST /api/posts/hashtags
    def hashtags      
      render json: @post.tag_list
    end

    # POST /api/posts/search/hashtags
    def search_hashtags
      @posts = Post.tagged_with(params[:tag])
      render json: @posts
    end

    # POST /api/posts/pagenation
    def pagenation
      @posts = @posts.page(params[:page]).per(PER)
      render json: @posts
    end
    # POST /api/posts/search
  
    # GET /api/posts/1
    # GET /api/posts/1.json
    def show
      render json: @post
    end
  
    # GET /api/posts/new
    def new
      @post = Post.new
      render json: @post
    end
  
    # GET /api/posts/1/edit
    def edit
      render json: @post
    end
  
    # POST /api/posts
    # POST /api/posts.json
    def create
      @post = Post.new(post_params)

      @post.user_id = current_user.id

      add_tags
      
      if @post.save
        render json: @post
      else
        render json: @post.errors
      end
    end
  
    # PATCH/PUT /api/posts/1
    # PATCH/PUT /api/posts/1.json
    def update

      @post.tags.destroy_all

      @post.user_id = current_user.id

      add_tags

      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors
      end
    end
  
    # DELETE /api/posts/1
    # DELETE /api/posts/1.json
    def destroy
      render json: @post.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      def set_post_with_place
        @posts = Post.all.where(place_id: params[:place_id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :content, :place_id)
      end

      def tags_params
        params.require(:post).permit(:tags)
      end

      def add_tags
        tags = tags_params[:tags]
        tags.split(" ").each do |tag|
          @post.tag_list.add(tag)
        end
      end
  end