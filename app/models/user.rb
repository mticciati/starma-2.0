class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_one :chart_vedic
  # has_one :chart_western

 	# Model actions
	 # scope :random, limit: 10
 	# in controller - @random = User.random
end
