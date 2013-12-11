require 'csv'
require 'drawer'
require 'vertex'
require 'graph_drawer'

vertexes=[]
vertcount=0

CSV.foreach(ARGV[0]) do |r|

	next if r==nil
	if ((vertexes.include?r[0])==false) 
		vertexes<<r[0]
		vertcount+=1
			if (vertexes.include?r[1]==false)
				vertexes<<r[1]
				vertcount+=1
		 
	end
	end
end

d = Drawer.new "Stefan_Stamenov.svg", 550, 350
d.start
graph = GraphDrawer.new d


for i in 0..vertcount-1
graph.vs[i]=Vertex.new("#{vertexes[i]}")
end

CSV.foreach(ARGV[0]) do |e|
for i in 0..vertcount-1
	if e[0]==vertexes[i]
		begg=graph.vs[i]
	end
end

for i in 0..vertcount-1
	if e[1]==vertexes[i]
		endd=graph.vs[i]
	end
end
graph.edges<<[begg,endd]
end

graph.draw 
d.finish


