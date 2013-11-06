files = Dir.glob("*.rb")
files.each do |file|
	`ruby #{file} 1 100 -1 100 1 -100 -1 -100` unless file =~ /test/
end
