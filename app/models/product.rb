class Product < ActiveRecord::Base

	before_save  :generate_code 

	belongs_to :category
	has_many :cart_line_items
	has_many :order_line_items
	
	validates_presence_of :title, :description, :in_stock, :category_id, :price
	validates_numericality_of :price, :in_stock, :category_id
	validates_uniqueness_of :title

	private 

	def generate_code
		self.code = "DCT-#{SecureRandom.hex[0..8]}"
	end


end
