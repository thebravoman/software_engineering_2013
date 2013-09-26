#!/usr/bin/ruby

require 'csv'

m1 = 0.0
CSV.foreach( 'bank.csv' ) { |r| m1 += r[1].to_f }
printf "%.2f\n", m1

