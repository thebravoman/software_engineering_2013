require "csv"
i = 0
proverka = ""
ime = ""
Dir["/home/stoyan/software_engineering_2013/class7_homework/*.rb"].each {|tekusht_fail|
	proverka = tekusht_fail.scan(/test/)
	proverka = proverka.to_s
	if proverka != 'test'
		rezultat_na_programata = `ruby #{tekusht_fail} bau.srt`
		rezultat_na_programata = rezultat_na_programata.to_s
		pomoshtno_ime = tekusht_fail.split("/").last
		pomoshtno_ime = pomoshtno_ime.split("_")[0..1]
		pomoshtno_ime[1] = pomoshtno_ime[1].split(".").first
		ime = ime + pomoshtno_ime[0] + " " + pomoshtno_ime[1]
		File.open("rezultat.txt", "r") do |fail|
			if rezultat_na_programata == fail.to_s
				ime = ime + "," + "1" + "\n"
			else
				ime = ime + "," + rezultat_na_programata + "," + "0" + "\n"
			end
		fail.close
		end
	end
}
File.open("results1.csv", "wb") do |f|
	f.write(ime)
f.close
end
