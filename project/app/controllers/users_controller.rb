class UsersController < ApplicationController

	def show
		set_user
	end

	def index
		@users = User.all 
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to new_product_path
		else 
			render :new
		end
	end

	def edit
		set_user
	end

	def update
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		set_user 
		@user.destroy
		redirect_to users_path
	end

	private
	
	def set_user
		@user=User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
