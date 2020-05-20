class CommentsController < ApplicationController
    before_action :authorized, only: [:create]

    def create
        @feature = Feature.find(params[:feature_id])
        @comment = @feature.comments.create(comments_params)
        redirect_to feature_path(@feature)
    end  
    
    
    private
    def comments_params
        params.require(:comment).permit(:comment)
    end    
end



