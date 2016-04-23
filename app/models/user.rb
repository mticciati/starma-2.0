class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 18 }
  validates :birthday, presence: true
  validates_format_of :username, :with => /\A[a-zA-Z0-9_-]+\z/, :on => [:create, :update]
  validate :of_age
  geocoded_by :location
  after_validation :geocode

  # validates :terms_of_service, acceptance: { accept: 'yes' }
  # before_save :create_charts

  # before_save :combine_birthday

  scope :all_except, ->(user) { where.not(id: user) }

  scope :username, ->(username) { where(username: username) }

  def of_age
    d = Date.today
    if birthday > d.prev_year(18)
      errors.add( :user, "Must be 18 or older to join!" )
    end
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
