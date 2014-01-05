class RandomGroupCreator
	attr_accessor :size

	def initialize
		@size = 0
	end

	def set_size
		self.size = rand(1..3)
	end

end
