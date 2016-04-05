class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # before_save :create_charts

  has_many :messages

  scope :all_except, ->(user) { where.not(id: user) }

  def foo
    "foo"
  end

  # has_one :chart_vedic, as: :chartable
  # has_one :chart_western, as: :chartable

 	# Model actions
	  # scope :random, limit: 10
 	# in controller - @random = User.random

  # def create_charts
    # Chart_vedic.new(self)
    # Chart_western.new(self)

end
