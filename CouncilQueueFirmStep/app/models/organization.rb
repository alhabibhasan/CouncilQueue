class Organization < ApplicationRecord
	validates :name, presence: true
	validates :visitor_type, presence: true
end
