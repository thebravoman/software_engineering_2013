#!/usr/bin/ruby

require 'csv'
require 'date'

d1 = Date.strptime( ARGV[0], '%d/%m/%Y' )
d2 = Date.strptime( ARGV[1], '%d/%m/%Y' )

profit = 0.00
expense = 0.00



CSV.foreach("bank.csv") do |row|
    time = Date.strptime( row[0], '%d/%m/%Y' )
    if time >= d1 and time <= d2
        profit += row[1].to_f
        expense += row[2].to_f
    end
end

balance = profit - expense

printf "%.2f,%.2f,%.2f", profit, expense, balance
