class UsersController < ApplicationController
    before_action :correct_user, only: [:show, :update, :edite, :destroy]
    skip_before_action :login_required, only: [:new, :create]
    def index
      @users = User.all
    end
   def new
    @user = User.new
   end
   def create
      @user = User.new(user_params)
      if @user.save
        log_in(@user)#appel de la méthode lors enregistrement, pour se connecter en même temps
        redirect_to user_path(@user.id)
        
      else
        render :new
      end
    end
    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[ :id])
    end

    def update
    if @user.update(user_params)
      flash[:notices] = ["Your profile was successfully updated"]
      render 'show'
      
    else
      render :edit
    end
  end
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_path, notice: t('.destroyed')
  end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to current_user unless current_user?(@user)
    end
  end

