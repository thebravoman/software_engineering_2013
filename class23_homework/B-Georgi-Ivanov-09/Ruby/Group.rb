class Group
	def initialize
		@people_in_group = rand(3) + 1
	end
	
	def get_people_in_group
		return @people_in_group
	end
end