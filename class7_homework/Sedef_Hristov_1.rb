require 'date'
require 'time'

sb = Array.new
t2 = nil
t1 = nil
co = 0

f = File.open(ARGV[0]).each do |ln|
         temp = ln.to_s
         if ln !=~ / --> / && temp.length > 3
                if sb[co] != nil
                        sb[co] = sb[co] + " " + temp
                else
                        sb[co] = temp
        end
                if ln =~ / --> /        
                       if t1 || t2 == nil

                               t1 = Time.parse(line.split(" --> ")[0])
                               t2 = Time.parse(line.split(" --> ")[1])
                        else
                               t1 = Time.parse(line.split(" --> ")[0])                                
                                h = t1 - t2
                               if h.nsec > 3000000000
                                                co += 1                        
                                end
                                t2 = Time.parse(line.split(" --> ")[1])                                
                       end
             end
end
 puts sb
end

