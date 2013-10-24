require "csv"
res1=0
res2=0
bukva=ARGV[1].to_s
all=Array.new()



class Array
  def sorted?
a=Array.new()
for i in (0...self.size)
       a[i]=self[i]
end
   for i in (0...self.size)
      return false if self[i] != a[i]
  end
end
end

CSV.foreach(ARGV[0],"r") do |row|
i=row[0].to_s.count(bukva)
if i>0
res1=1
end
all<<[row[0]]
end


if all.sorted?
res2=1 

end

if res1==1 && res2==1
p 1
else p 0 end
