subs = String.new
subs2 = Array.new
i = 0
z = 0
f = false
f1 = true
f2 = true

File.open(ARGV[0]).each do |line|
        if line =~ /-->/
                line = line.split("-->")[0..1]                
                if f1 == false
                        a = line[0].split(":")[0..2]        
                        subs1 = a[0].strip.to_f*60*60+ a[1].to_f*60 + a[2].gsub(",",".").to_f                        
                else
                        f1 = false
                end
                b = line[1].split(":")[0..2]
                subs2[z] = b[0].strip.to_f*60*60 + b[1].to_f*60 + b[2].gsub(",",".").to_f        
                z+=1
                
                if subs1 != nil
                        f2 = subs1 - subs2[z-2] < 3
                end        
                f = true        
                i=0                
        elsif i > 0 && f == true        
                if line!="\n"
                        if f2 == true
                                subs += line.gsub(/\n/,'')
                        elsif f2 == false
                                subs += "\n" + "\n" + line.gsub(/\n/,'')
                        end        
                end
        end        
        i+=1        
        if line == "\n" 
                f = false
        end
end 

out_file = File.new("Spas_Spasov.txt", "w")
out_file.puts(subs)
out_file.close
