class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :username, :mobile, :gender
  validates_uniqueness_of :username, :mobile
  validates_numericality_of :mobile
  validates_length_of :mobile, is: 10 

  has_many :cart_line_items
  has_many :orders


end

