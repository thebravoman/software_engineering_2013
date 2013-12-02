require_relative "Martin_Kuzev/Csv_to_Vertexes"

d = Csv_Vertexes.new "Vertexes.csv", "Martin_Kuzev.svg", 350, 240
d.draw_them

