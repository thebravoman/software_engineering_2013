`ruby #{ARGV[0]} 20`
puts `diff -q -a dst1.csv task_1_expected.csv` == ""