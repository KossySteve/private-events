class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    @prev_events = @user.previous_event
    @upcoming_events = @user.upcoming_event
  end

 
  def new
    @user = User.new
  end

  
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  

  private
    
    def user_params
      params.require(:user).permit(:name, :email)
    end

   
end
