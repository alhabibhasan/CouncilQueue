require 'date'
class CouncilQueue < ApplicationRecord

	def self.getQueue

		# get todays date so the queue will only have elements added in today
		# meaning older entires aren't included
		# Note: The time stamp given to the records added to the DB is 1 hour late.
		# So records for the next day will appear after 01:00 am
		@time = Time.now.strftime("%Y-%m-%d")

		puts(@time)

		citizenQuery = "SELECT visitor_type,title, firstname, lastname, CONCAT(title , ' ' , firstname , ' ' , lastname) 
		AS Name, service, created_at 
		FROM citizens 
		WHERE (created_at LIKE '%#{@time}%')
		ORDER BY created_at ASC;"

		@citResults = Citizen.find_by_sql(citizenQuery);

		anonymousQuery = "SELECT visitor_type, visitor_type AS Name, service, created_at 
		FROM anonymous_visitors 
		WHERE (created_at LIKE '%#{@time}%')
		ORDER BY created_at ASC;"

		@anonResults = AnonymousVisitor.find_by_sql(anonymousQuery)

		orgQuery = "SELECT visitor_type, name AS Name, service, created_at 
		FROM organizations 
		WHERE (created_at LIKE '%#{@time}%')
		ORDER BY created_at ASC;"

		@orgResults = Organization.find_by_sql(orgQuery)

		# merge all the results together
		@joined = @citResults + @anonResults + @orgResults;

		# sort them based on the time of arrival and return
		@joined.sort{|x,y| Time.parse(x.created_at.to_s[10..15]) <=> Time.parse(y.created_at.to_s[10..15]) }


		
	end

end
