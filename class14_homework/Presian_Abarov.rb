require_relative 'Presian_drawer'
require 'csv'

d = Drawer.new 'chart.svg', 350, 350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read('../class14/data.csv')

max_height = array_of_values[1][1..-1].sort[-1].to_i
p max_height

(0..max_height).step(max_height/5) do |y|
	d.text y.to_s, -40, y+4
	d.line -40, y, 80, y
end

chart_drawer.columns_chart array_of_values

d.finish