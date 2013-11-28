files = Dir.glob("**/*.rb")
files.each do |file_place|
	file = file_place.split("/")
	if (file.length > 2)
		if (file[-1] == "graph_drawer.rb" || file[-1] == file[-2]+".rb")
			`ruby #{file_place}`
		end
	else
		if (file[-1] != "drawer.rb" && file[-1] != __FILE__)
			`ruby #{file_place}`
		end
	end
end

files = Dir.glob("*.svg")
files.each do |file_place|
	`chromium-browser #{file_place} &`
end
