f = File.open(ARGV[0], "r")
pred_red="\n"
subs=0
while (line = f.gets) do
	if line==pred_red
	next
	end
	if line=="\n"
		subs=subs+1
	end
	 pred_red=line	
end
puts subs
f.close
	