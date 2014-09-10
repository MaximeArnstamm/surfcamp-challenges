# Encoding: utf-8
require 'csv'

def csv_to_mov(row)
  mov = {}
  mov[:name] = row[0]
  mov[:year] = row[1].to_i
  mov[:earnings] = row[2].to_i

  mov
end

def most_successfull(number, max_year, file_name)
  #TODO: return the number most successfull movies max_year
  movies = []

  CSV.foreach(file_name, encoding: "iso8859-1") do |row|
    if row[1].to_i < max_year
      movies << csv_to_mov(row)
    end
  end

  movies.sort_by { |mov| mov[:earnings] }.reverse.take(number)
end
