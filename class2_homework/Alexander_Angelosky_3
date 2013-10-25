require "csv"
$dates = Array.new
$incomes = Array.new
def calculate_incomes
 i = 0
 CSV.foreach("bank.csv") do |row|
  $dates[i] = row[0]
  if $dates[i] == $dates[i-1] and i>0 then
   $incomes[i] = $incomes[i-1]+row[1].to_f
  else
   $incomes[i] = row[1].to_f
  end
  i = i+1
 end
end
def convert_to_other_date_format
 0.upto($dates.length-1) do |i|
  k = $dates[i]
  $dates[i] = k[6, 4]+k[3,2]+k[0,2]
 end
end
def sort_arrays
 0.upto($incomes.length-1) do |i|
  max = i;
  (i+1).upto($incomes.length-1) do |j|
   if $dates[j]>$dates[max] then
    max = j
   end
  end
  temp = $dates[max]
  $dates[max] = $dates[i]
  $dates[i] = temp
  temp = $incomes[max]
  $incomes[max] = $incomes[i]
  $incomes[i] = temp
 end
end
def convert_to_my_date_format
 0.upto($dates.length-1) do |i|
  k = $dates[i]
  $dates[i] = k[6,2]+"/"+k[4,2]+"/"+k[0, 4]
 end
end
def calculate_max
 max = 0
 1.upto($incomes.length-1) do |i|
  if $incomes[max]<$incomes[i] then
   max = i
  end
 end
 puts $dates[max]
end 
calculate_incomes
convert_to_other_date_format
sort_arrays
convert_to_my_date_format
calculate_max
