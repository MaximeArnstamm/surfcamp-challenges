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
  attempt.downcase.chars.to_a.all? { |l| grid.include?(l) || grid.include?(l.upcase) }
end

def english_word(attempt)
  translation = JSON.parse(open("http://api.wordreference.com/0.8/80143/json/enfr/" + attempt).read)
  if (translation.has_key?("Error"))
    false
  else
    translation["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
  end
end

def compute_score(attempt, time)
  attempt.size + 1/time
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result
  res = {}
  res[:time] = game_time(start_time, end_time)

  translation = english_word(attempt)

  if (!valid_letters(attempt, grid))
    res[:score] = 0
    res[:message] = "not in the grid"
  elsif (!translation)
    res[:score] = 0
    res[:message] = "not an english word"
  else
    res[:translation] = translation
    res[:message] = "well done"
    res[:score] = compute_score(attempt, res[:time])
  end

  res
end
