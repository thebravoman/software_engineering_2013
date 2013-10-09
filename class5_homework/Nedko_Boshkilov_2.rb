first_str=""
last_str=""
start=0
stop=0
final=0
lastnum=1
flag=0
flag2=0
temp=[]
srt1 = File.readlines(ARGV[0]).each do |line|
    if(line.to_i==lastnum)
        lastnum+=1
    end
end
lastnum-=1
sr2 = File.readlines(ARGV[0]).each do |row|
    if(flag2==1)
        first_str=row
        flag2=0
    end
    if(flag==1)
        last_str=row
        flag=0
    end
    if(row.to_i==1)
        flag2=1
    end
    if(row.to_i==lastnum)
        flag=1
    end
end
temp=first_str.split(" --> ")[0..-1]
first_str = temp[0]
temp=last_str.split(" --> ")[0..-1]
last_str = temp[1]
temp=first_str.split(":")[0..-1]
start=temp[0].to_i*60+temp[1].to_i
start*=60
temp=temp[2].split(",")[0..-1]
start+=temp[0].to_i
start*=1000
start+=temp[1].to_i
temp=last_str.split(":")[0..-1]
stop=temp[0].to_i*60+temp[1].to_i
stop*=60
temp=temp[2].split(",")[0..-1]
stop+=temp[0].to_i
stop*=1000
stop+=temp[1].to_i
final=stop-start
final*=1000000
puts final