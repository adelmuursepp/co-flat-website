class LikesController < ApplicationController

    def create
        @apartment_id = params[:apartment_id]
        if !Like.where(user_id: current_user.id, apartment_id: @apartment_id).first
            @like = Like.new(like_params)
            @like.user_id = current_user.id
            @like.apartment_id = params[:apartment_id]
            @like.save!
            redirect_back(fallback_location: request.referer)
            flash[:success] = "Lisatud, et otsid korterikaaslasi"
        end
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_back(fallback_location: request.referer, notice: "Eemaldatud huvipakkuvate kuulutuste seast")
    end

    private
    def like_params
        params.require(:like).permit(:comment, :apartment_id)
    end
end