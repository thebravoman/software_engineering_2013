require "csv"


class CSVtoGRAPH 
        attr_accessor :results
        attr_accessor :mass
        attr_accessor :vs
        
        
          def initialize
                @results = Hash.new(0)
                @mass = []
                @vs = []
        end
        

	def parser	
		CSV.foreach(File.join ARGV[0]) do |row|
			mass << row
			haskey row[0]
			haskey row[1] 
		end
	
	end
	

	def haskey element
		if results.has_key?(element)
			results[element] += 1
		else
			results[element] = 1
		end
	end
	
	def edges_catchemall
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
                @results.each_key {|key| vs << Vertex.new(key)}
                return vs
        end
end
