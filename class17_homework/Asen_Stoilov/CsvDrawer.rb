require_relative "vertex"
require "csv"


class CsvDrawer 
	attr_accessor :all
	attr_accessor :edges
	attr_accessor :vs
	attr_accessor :arr
	
	def initialize 
		self.arr = []
		self.vs = []
		@all = []
		self.edges = []

	end
	

	def arrs_make
		CSV.foreach(ARGV[0],"r") do |row|
			all << row
		end
		
		@all.each do |row|
			 if arr.include?(row[0].to_s) == false
			 	arr << row[0]
			 end
			 if arr.include?(row[1]) == false
			 	arr << row[1]
			end
		end
		arr.each  {|key| vs << Vertex.new(key)}
	end
	
	
	
	 def get_edges
                @all.each do |row|
                        source = vs[vertex_id row[0]]
                        target = vs[vertex_id row[1]]
                        edges << [source,target]
                end
		return edges  
        end
        
        def vertex_id vname
                i = arr.index(vname.to_s)
                return i
        end
	
	def get_vertex
                return vs
        end

end
	
	

