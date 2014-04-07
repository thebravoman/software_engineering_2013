# Arguments must be entered in this sequence: message, encription, decription, n, e, d
# Example: ruby Ivo_Victor_11b_2.rb 42 1 0 36853 3 24299

if ARGV[1].to_i == 1
	puts (ARGV[0].to_i ** ARGV[4].to_i) % ARGV[3].to_i
elsif ARGV[2].to_i == 1
	puts (ARGV[0].to_i ** ARGV[5].to_i) % ARGV[3].to_i
end	
