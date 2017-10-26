class Citizen < ApplicationRecord
	validates :visitor_type, presence: true
	validates :title, presence: true
	validates :firstname, presence: true
	validates :lastname, presence: true
end
