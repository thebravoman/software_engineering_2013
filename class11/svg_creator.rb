require_relative 'drawer'

drawer = Drawer.new "result.svg", 350, 300
drawer.start
drawer.cs
drawer.point(100,150)
drawer.rect(100,100)
drawer.circle(200,200,70)
drawer.text("10", 10, -10)
drawer.finish
