require_relative "Ivaylo_Markov/graph_drawer"

ARGV.empty? ? num_vs = 12 : num_vs = ARGV[0].to_i
ARGV[1].nil? ? num_edges = num_vs/2 : num_edges = ARGV[1].to_i



d = Drawer.new "Ivaylo_Markov.svg", 300, 350
d.start
graph = GraphDrawer.new d

num_vs.times do 
	graph.add_vertex("#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}")
end

num_edges.times do
	src = rand(num_vs)
	trg = rand(num_vs)
	
	while src==trg
		trg = rand(num_vs)
	end

	graph.add_edge src,trg
end



graph.draw

d.finish
