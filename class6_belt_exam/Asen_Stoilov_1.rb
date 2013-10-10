require "csv"

nom=[]
data=[]
credit=[]
poluchatel=[]
zabel=[]
i=0
CSV.foreach("bank.csv") do |row|
nom[i]=row[0].to_i
data[i]=row[1].to_s
credit[i]=row[2].to_i
poluchatel[i]=row[3].to_i
zabel[i]=row[4].to_i

i++
end
i=0
CSV.open("bank_result.csv", "wb").each do |r|

csv << [nom[i].to_s , data[i].to_s , credit[i].to_s , poluchatel[i].to_s , zabel[i].to_s]
i++
end


