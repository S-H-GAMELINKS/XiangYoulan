class Api::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update]

    def user_session
        render json: current_user
    end

    def feed
        follow_place_id = current_user.followees(Place).map{|p| p.id}

        @activities = PublicActivity::Activity.order("created_at DESC").where(owner_type: "Place", owner_id: follow_place_id).all

        render json: @activities
    end

    def show
        render json: @user
    end

    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors
        end
    end

    private

        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:name, :about, :email)
        end
end