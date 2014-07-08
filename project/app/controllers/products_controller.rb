class ProductsController < ApplicationController
	def show
		set_product
	end

	def index
		@products = product.all 
	end

	def new
		@product = product.new
	end
	
	def create
		@product = product.new(product_params)
		if @product.save
			redirect_to new_product_path
		else 
			render :new
		end
	end

	def edit
		set_product
	end

	def update
		if @product.update(product_params)
			redirect_to product_path(@product)
		else
			render :edit
		end
	end

	def destroy
		set_product 
		@product.destroy
		redirect_to products_path
	end

	private
	
	def set_product
		@product=product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :email, :password)
	end

end
