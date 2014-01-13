class Group
	def initialize
		# Generates a group with random members [1;3]
		@members = 1 + rand(3)
	end
	
	def members
		return @members
	end
end