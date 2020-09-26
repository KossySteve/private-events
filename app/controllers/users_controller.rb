class UsersController < ApplicationController
 

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
   # @user = User.find_by_email(params[:email])
  
  end

  # GET /users/new
  def new
    @user = User.new
  end

 

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

 

  private
    
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
