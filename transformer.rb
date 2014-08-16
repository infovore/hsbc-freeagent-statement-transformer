#!/usr/bin/env ruby

require 'csv'

unless ARGV[0]
  puts "Usage: transformer.rb [statement.csv]"
  exit
end

def extract_date(date_string)
  d = Date.parse(date_string)
  d.strftime("%d/%m/%Y")
end

def extract_value(row)
  val = nil
  if row['Paid out'] != ""
    val = 0 - row['Paid out'].to_f
  end
  if row['Paid in'] != ""
    val = row['Paid in'].to_f
  end
  sprintf("%.02f", val)
end

def transform_row(row)
  [
   extract_date(row['Date']),
   extract_value(row),
   row['Description']
  ]
end

csv_string = CSV.generate do |csv|
  CSV.foreach(ARGV[0], :headers => :first_row) do |row|
    if(row['Type'] != "")
      csv << transform_row(row)
    end
  end
end

puts csv_string
