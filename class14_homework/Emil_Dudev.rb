#!/usr/bin/ruby

require_relative 'Emil_Dudev/chart_drawer.rb'

d = Drawer.new "chart.svg", 350,350
d.start

chart_drawer = ChartDrawer.new d
array_of_values = CSV.read("data.csv")

chart_drawer.columns_chart array_of_values

d.finish
