count=0

if File.zero?(ARGV[0])
        count="Empty file"
end

if File.exists?(ARGV[0])
else
        puts ""
        puts ""
        puts"File does not exist or has been removed!"
        puts ""
        puts ""
end

f=File.open(ARGV[0],'r').each {
        |line| count=count+1 if line =~ /-->/
                                }
f.close

if count=="Empty file"

        puts ""
    print count
        puts ""

else

        puts ""
    print "Count: "
    print count
        puts ""

end

