class PoiPosition < ActiveRecord::Base
  belongs_to :vedic_chart, polymorphic: true
  belongs_to :western_chart, polymorphic: true
end
