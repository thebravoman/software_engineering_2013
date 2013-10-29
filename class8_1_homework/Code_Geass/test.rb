require 'csv'
#CODE GEASS
test=1337

case test

when ARGV[0]=1
	test1
when ARGV[0]=2
	test2
when ARGV[0]=3
	test3
when ARGV[0]=4
	test4
when ARGV[0]=5
	test5
when ARGV[0]=6
	test6
end
#------------------------------------------------
def test1
	Dir.glob("*1.rb").each do |file|
		name=file.split("1")[0]
		`ruby #{file} Radiant intelligence`
		a = `diff "*task1_output.csv expected_output_task1.csv`
		if a==""
			result=true
		else
			result=false
		end
		a << [name,result]
		puts a
	end
end

def test2
	Dir.glob("*2.rb").each do |file|
		name=file.split("2")[0]
		`ruby #{file} str`
		a = `diff "*task2_output.csv expected_output_task1.csv`
		if a==""
			result=true
		else
			result=false
		end
		a << [name,result]
		puts a
	end
end

def test3
	Dir.glob("*3.rb").each do |file|
		name=file.split("3")[0]
		p name
		`ruby #{file}` 
		a = `diff "*task3_output.csv expected_output_task1.csv`
		if a==""
			result=true
		else
			result=false
		end
		a << [name,result]
		puts a
	end
end

def test4
	Dir.glob("*4.rb").each do |file|
		name=file.split("4")[0]
		`ruby #{file} str`
		a = `diff "*task4_output.csv expected_output_task1.csv`
		if a==""
			result=true
		else
			result=false
		end
		a << [name,result]
		puts a
	end
end

def test5
	Dir.glob("*5.rb").each do |file|
		name=file.split("5")[0]
		`ruby #{file} Zeus`
		a = `diff "*task5_output.csv expected_output_task1.csv`
		if a==""
			result=true
		else
			result=false
		end
		a << [name,result]
		puts a
	end
end

def test6
	Dir.glob("*6.rb").each do |file|
		name=file.split("6")[0]
		`ruby #{file} 280`
		a = `diff "*task6_output.csv expected_output_task1.csv`
		if a==""
			result=true
		else
			result=false
		end
		a << [name,result]
		puts a
	end
end