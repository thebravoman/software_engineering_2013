 total = String.new
    i = 0; x = 0; y = false; f = true; g = true ;
    stime = Array.new
     
     
    File.open(ARGV[0]).each do |line|
            if line =~ /-->/
                    line = line.split("-->")[0..1]         
                    if f == false
                            a = line[0].split(":")[0..2]   
                            time = a[0].strip.to_f*60*60+ a[1].to_f*60 + a[2].gsub(",",".").to_f                   
                    else
                            f = false
                    end
                    b = line[1].split(":")[0..2]
                    stime[x] = b[0].strip.to_f*60*60 + b[1].to_f*60 + b[2].gsub(",",".").to_f       
                    x+=1
                   
                    if time != nil
                            g = time - stime[x-2] < 3
                    end    
                    y = true       
                                
            elsif  y == true       
                    if line!="\n"
                            if g == true
                                    total += line.gsub(/\n/,'')
                            elsif g == false
                                    total += "\n" + "\n" + line.gsub(/\n/,'')
                            end    
                    end
            end    
               
            if line == "\n"
                    y = false
            end
    end
     
     
    File.open("Martin_Kuzev.txt","w") do |file|
            file.write(total)
    end
