load 'Drawer.rb'
load 'MathDrawer.rb'


d=Drawer.new "Alexander_Bonev.svg",300,300
d.start
d.cs
d.cs_arrows
d.lining
m=MathDrawer.new d
m.number_of_arguments
m.grafika ARGV[0].to_i,ARGV[1].to_i,ARGV[2].to_i
d.finish

