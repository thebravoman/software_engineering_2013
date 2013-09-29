require 'csv'

bigg=0.0
pdate=''
ndate=''

CSV.foreach("bank.csv") do |r|
		
		s=r[1].to_f
		ndate=r[0]
		
		if pdate==ndate
			bigg+=s
			pdate=ndate
		elsif
			  s>bigg
		      bigg=s
		      pdate=ndate
		end

end
puts pdate
