require 'date'
class CouncilQueue < ApplicationRecord

	def self.getQueue

		@time = Time.now.strftime("%Y/%m/%d")

		citizenQuery = "SELECT visitor_type,title, firstname, lastname, CONCAT(title , ' ' , firstname , ' ' , lastname) 
		AS Name, service, created_at 
		FROM citizens 
		WHERE (created_at LIKE '%#{@date}%')
		ORDER BY created_at ASC;"

		@citResults = Citizen.find_by_sql(citizenQuery);

		anonymousQuery = "SELECT visitor_type, visitor_type AS Name, service, created_at 
		FROM anonymous_visitors 
		WHERE (created_at LIKE '%#{@date}%')
		ORDER BY created_at ASC;"

		@anonResults = AnonymousVisitor.find_by_sql(anonymousQuery)

		orgQuery = "SELECT visitor_type, name AS Name, service, created_at 
		FROM organizations 
		WHERE (created_at LIKE '%#{@date}%')
		ORDER BY created_at ASC;"

		@orgResults = Organization.find_by_sql(orgQuery)

		@joined = @citResults + @anonResults + @orgResults;

		@joined.sort{|x,y| Time.parse(x.created_at.to_s[10..15]) <=> Time.parse(y.created_at.to_s[10..15]) }


		
	end

end
