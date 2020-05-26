class CommentsController < ApplicationController
    before_action :authorized, only: [:create]

    def create
        @user_name = current_user.firstname
        @feature = Feature.find(params[:feature_id])
        @comment = @feature.comments.new(comments_params)
        if @comment.save
            #mail when a comment is posted
            CommentMailer.with(feature: @feature).comment_mail.deliver
        end    
       respond_to do |format|
            format.html { redirect_to feature_path(@feature) }
            format.js
        end    
    end  
    
    private
    def comments_params
        params.require(:comment).permit(:comment, :name)
    end    
end



