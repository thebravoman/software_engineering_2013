require_relative "graph_drawer"
require "csv"

class GToCSV

	def initialize csvfile, graph
		@names = {}
		@csv = csvfile
		@graph = graph
		generate
	end

	private 
	def fill_name name
		if @names[name].nil?
			@names[name] = Vertex.new(name)
			@graph.vs << @names[name]
		end
	end

	private
	def generate
		CSV.foreach(ARGV[0]) do |line|
			fill_name line[0].to_s
			fill_name line[1].to_s
			@graph.edges << [@names[line[0].to_s], @names[line[1].to_s]]
		end
	end
end