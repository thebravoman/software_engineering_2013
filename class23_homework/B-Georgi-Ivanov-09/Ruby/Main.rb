require_relative "Group"
require_relative "Plane"

plane = Plane.new 27, 6, 3 # 27 rows, 6 seats per row, the walkway is after the 3rd seat
plane.fill_plane
plane.print_all_seats
plane.fly_plane # Planes must fly!