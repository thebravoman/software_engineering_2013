require 'csv'
require_relative 'Kiril_Kostadinov/drawer'
require_relative 'Kiril_Kostadinov/vertex'
require_relative 'Kiril_Kostadinov/graph'

d = Drawer.new "Kiril_Kostadinov.svg", 300, 350
d.start
graph = GraphDrawer.new d
data = CSV.read(ARGV[0])
vertexes = Hash.new(0)
i = 1
index = 0
data.each do |row|
	vx = []
	row.each do |v|
		if vertexes[v] == 0
			vertexes[v] = i
			i += 1
			graph.vs << Vertex.new(v)
		end
		vx[index] = graph.vs[vertexes[v].to_i-1]
		index += 1
	end
	graph.edges << vx
	index = 0
end
graph.draw
d.finish

#A random curcuit appeared
#
#      SW3
#+6V -o_|_o----+----------+----------->>--------+----------+----->>
#              |          |                     |          |
#            LAMP1        |                     |        LAMP2
#              |          | SW1                 | SW2      |
#              +--A>     |o              <A--   o|         |
#              |       ==|    --B>          |    |==   <B--+
#            -----       |o   |             |   o|       -----
#      SCR1  \   /        |   |             |   |        \   /  SCR2
#             \ /        R3   ^             ^   R4        \ /
#            -----        |  CR1           CR2  |        -----
#              |  \       |   |             |   |       /  |
#              |   +--R2--+---+             +---+--R5--+   |
#              |   |                                   |   |
#              |   R1                                 R6   |
#              |   |                                   |   |
#GND ----------+---+----------------->>----------------+---+--->>