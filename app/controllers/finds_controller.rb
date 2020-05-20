class FindsController < ApplicationController
    before_action :authorized, only: [:create, :new, :show]

    def new
        @user_id = current_user.id
        @find = Find.new
    end
    
    def create
        @find = Find.create(find_params)
        redirect_to @find
    end
    
    def show
        @user_id = current_user.id
        @user_name = current_user.firstname
        @find = Find.find(params[:id])
    end
    
    private
    def find_params
        params.require(:find).permit(:keyword, :status)
    end    

end
