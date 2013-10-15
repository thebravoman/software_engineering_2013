require 'CSV'
asd=[]
arr=[]
i=0
File.readlines(ARGV[0]).each do |line|
   if line.include? '-->'
   line=line.gsub(",",".")
   broi=line.split('-->')[0..1]
   a=broi[1].split(':')[0..2]
   k=broi[0].split(':')[0..2]
   arr[i] << [broi[0],broi[1],a[2],k[2]]
   next 
  else asd << line
      
end
i=0
File.open("putname.txt",'w').each do |f|
  begin
 if i==0 
   f << [arr[i][0],/n,asd[i]]
 elsif arr[i][4]-arr[i+1][3]> 3.00
   f << ['\n',arr[i][0],asd[i]]
  else 
   f<< [asd [i]]
   
 end
   i+=1       
   end while i<arr.size
   
end
