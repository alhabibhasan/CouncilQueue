class AnonymousVisitor < ApplicationRecord
	validates :visitor_type, presence: true
end
