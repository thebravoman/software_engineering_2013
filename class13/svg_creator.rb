require_relative 'drawer'

drawer = Drawer.new "result.svg", 300,400
drawer.start
drawer.cs
drawer.rect 100, 100
drawer.circle 200,200,70
drawer.text "10", 10, -15
drawer.point 100,150
drawer.finish
