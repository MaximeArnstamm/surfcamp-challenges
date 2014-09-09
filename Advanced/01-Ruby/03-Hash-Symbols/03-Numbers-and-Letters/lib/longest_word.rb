require 'open-uri'
require 'json'

def generate_grid(grid_size)
  #TODO: generate random grid of letters
  (0...grid_size).map { |_| rand(26).chr }
end

def game_time(start_time, end_time)
  end_time - start_time
end

def valid_letters(attempt, grid)
  attempt.downcase.chars.to_a.all? { |l| grid.include?(l) }
end

def english_word(attempt)
  false
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result
  res = {}
  res[:time] = game_time(start_time, end_time)

  if (!valid_letters(attempt, grid))
    res[:score] = 0
    res[:message] = "not in the grid"
  elsif (!english_word(attempt))
    res[:score] = 0
    res[:message] = "not an english word"
  end

  res
end
