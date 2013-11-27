require_relative 'drawer'

drawer = Drawer.new "Heart.svg", 650,300
drawer.start

drawer.point 0, -80
drawer.point 0, 48

drawer.point 10, -75
drawer.point 11, 53
drawer.point -10, -75
drawer.point -11, 53

drawer.point 19, -69
drawer.point 20, 60
drawer.point -19, -69
drawer.point -20, 60

drawer.point 28, -63
drawer.point 29, 67
drawer.point -28, -63
drawer.point -29, 67

drawer.point 36, -55
drawer.point 40, 70
drawer.point -36, -55
drawer.point -40, 70

drawer.point 43, -46
drawer.point 51, 69
drawer.point -43, -46
drawer.point -51, 69

drawer.point 50, -37
drawer.point 62, 64
drawer.point -50, -37
drawer.point -62, 64

drawer.point 55, -28
drawer.point 70, 55
drawer.point -55, -28
drawer.point -70, 55

drawer.point 60, -18
drawer.point 73, 44
drawer.point -60, -18
drawer.point -73, 44

drawer.point 65, -8
drawer.point 74, 33
drawer.point -65, -8
drawer.point -74, 33

drawer.point 70, 2
drawer.point 74, 22
drawer.point -70, 2
drawer.point -74, 22

drawer.point -73, 12
drawer.point 73, 12

drawer.point1 0,-55
drawer.point1 -20,-43
drawer.point1 -36,-21
drawer.point1 -48,5
drawer.point1 -55,30
drawer.point1 -50,45
drawer.point1 -55,30
drawer.point1 -36,49
drawer.point1 -15,35
drawer.point1 -25,20

drawer.point1 20,-43
drawer.point1 36,-21
drawer.point1 48,5
drawer.point1 55,30
drawer.point1 50,45
drawer.point1 55,30
drawer.point1 36,49
drawer.point1 15,35
drawer.point1 25,20


drawer.finish
