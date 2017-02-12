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
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

  ## CarrierWave file uploader
  mount_uploader :avatar, AvatarUploader

  has_one :custom_chart_data, dependent: :destroy
  has_one :vedic_chart, dependent: :destroy
  has_one :western_chart, dependent: :destroy
  has_many :favoriters, through: :favoriter_favorites, source: :favoriter, dependent: :destroy
  has_many :favoriter_favorites, foreign_key: :favoritee_id, class_name: "Favorite"

  has_many :favoritees, through: :favoritee_favorites, source: :favoritee, dependent: :destroy
  has_many :favoritee_favorites, foreign_key: :favoriter_id, class_name: "Favorite"


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
