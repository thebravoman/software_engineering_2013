class Group

	def initialize
		@members = []
	end
	
	def get_member id
		return @members[id]
	end
	
	def add_member new_member
		@members << new_member
	end
	
	def get_size
		@members.size
	end
	
	def clear
		@members.clear
	end
	

end
