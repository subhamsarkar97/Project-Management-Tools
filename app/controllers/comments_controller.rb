class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized, only: [:create]

    def create
        @user_name = current_user.firstname
        @feature = Feature.find(params[:feature_id])
        @comment = @feature.comments.new(comments_params)
        @comment.save!
        #mail when a comment is posted
        CommentMailer.comment_mail(@comment).deliver
        respond_to do |format|
            format.html { redirect_to feature_path(@feature) }
            format.js
        end    
    end  
    
    private
    def comments_params
        params.require(:comment).permit(:name, :body)
    end    

end



