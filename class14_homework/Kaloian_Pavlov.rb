require_relative "Kaloian_Pavlov/chart_drawer.rb"

d = Drawer.new "chart.svg", 500,500
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
