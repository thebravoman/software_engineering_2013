require 'csv'


class CsvParser
	attr_accessor :hash
	attr_accessor :mass
	attr_accessor :vs
	
	def initialize
		@hash = Hash.new(0)
		@mass = []
		@vs = []
	end
	
	def read
		CSV.foreach(ARGV[0]) do |csv|
			mass << csv
			if hash.has_key?(csv[0]) != true 
				hash[csv[0]] = 1
			else
				hash[csv[0]] += 1
			end
			if hash.has_key?(csv[1]) != true 
				hash[csv[1]] = 1
			else
				hash[csv[1]] += 1
			end
		end
	end
	
	def get_edges
		i=0
		j=0
		edges = []
		mass.each do |e|
			vs.each_index do |n|
				if vs[n].name==e[0]
					i=n
				end
				if vs[n].name==e[1]
					j=n
				end
			end
    	edges << [vs[i],vs[j]]
   	end
    return edges
	end
	
	def get_vertex
		@hash.each_key {|key| vs << Vertex.new(key)}
		return vs
	end
end
