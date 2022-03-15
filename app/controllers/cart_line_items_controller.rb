class CartLineItemsController < ApplicationController
	before_action :authenticate_user!

	def index
		@cart_items = current_user.cart_line_items
		@order = Order.new
	end

	def create
		product_id =  cart_line_item_params[:product_id]
		cart_line_item = current_user.cart_line_items.find_by(product_id: product_id)
		if cart_line_item
			cart_line_item.quantity += cart_line_item_params[:quantity].to_i
			cart_line_item.save
			redirect_to products_path, notice:"successfully added to cart"
		else
			@cart_item = CartLineItem.new(cart_line_item_params)
			if @cart_item.save
				redirect_to products_path, notice:"successfully added to cart"
			else
				redirect_to products_path, alert: "unable to add to cart"
			end		
		end
	end

	def destroy
		@cart_line_item = CartLineItem.find(params[:id])
		@cart_line_item.destroy
		redirect_to cart_line_items_path, notice: "The product has been deleted from cart" 
	end

	private 
	def cart_line_item_params
		params.require(:cart_line_item).permit(:product_id, :user_id, :quantity)
	end
end
