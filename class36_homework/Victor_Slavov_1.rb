# Arguments must be entered in this sequence: message, encription, decription, n, e, d
# Example: ruby Victor_Slavov_1.rb insertAGloriousMessageHere 1 0 45173 30959 39851

require 'bigdecimal'

i = 0
symbol = 0
buffer = []
current_number = ''

ARGV[0].each_char do |c|
	if ARGV[1].to_i == 1
		print ((BigDecimal.new(c.ord) ** BigDecimal.new(ARGV[4])) % BigDecimal.new(ARGV[3])).to_s('F').to_i.to_s + 'w'
	elsif ARGV[2].to_i == 1
		if c != 'w'
			buffer[i] = c.to_i
			i = i + 1
		else
			buffer = buffer.to_s.gsub(/\,/, '').gsub(/\]/, '').gsub(/\[/, '').gsub(/\ /, '')
			symbol = (((BigDecimal.new(buffer) ** BigDecimal.new(ARGV[5])) % BigDecimal.new(ARGV[3])).to_s('F')).to_i
			print symbol.chr
			buffer = []
			i = 0
		end
	end
end
