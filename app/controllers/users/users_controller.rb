class UsersController < ApplicationController
  before_action :authenticate_user! 
  def new
  end
  
  #def show
    #@user = User.find(params[:id])
    #if @user != current_user
      #redirect_to root_path, alert: "アクセス権がありません。"
    #end
  end


end
