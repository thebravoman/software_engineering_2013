files = Dir.glob("*.rb")
files.each do |file|
	`ruby #{file}` unless file =~ /test/
end
