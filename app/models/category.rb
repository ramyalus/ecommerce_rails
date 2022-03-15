class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy
	validates_presence_of :title, :description
	validates_uniqueness_of :title
end
