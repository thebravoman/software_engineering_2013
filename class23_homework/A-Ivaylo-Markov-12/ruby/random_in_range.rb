class RandomInRange

	def initialize low,high
		@lower_limit = low
		@upper_limit = high
	end
	
	def generate
		rand(@lower_limit..@upper_limit)
	end
	
end
