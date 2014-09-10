def open_and_read(filename)
 File.open(filename, "rb").read
end

def count_lines(contents)
  contents.lines.count
end

def count_total_lenght(contents)
  contents.length
end

def count_length(contents)
  contents.chars.count { |c| !" \r\n\t".include? c }
end

def count_words(contents)
  contents.split.count
end

def count_sentences(contents)
  contents.split(".").count
end

def count_paragraphs(contents)
  contents.split("\n\n").count
end

def compute_word_per_sentences(stats)
  stats[:words] / stats[:sentences]
end

def compute_sentences_per_paragraphs(stats)
  stats[:sentences] / stats[:paragraphs]
end

def count_useful_words(contents)
  contents.split.sort.uniq.count { |w| w.length > 3 }
end

def compute_usefulness(stats)
  perc = stats[:useful_words] / stats[:words].to_f * 100
  "#{perc.to_i} %"
end

def is_of_average_size(sentence, average)
  l = sentence.split.size
  l >= average - 5 && l <= average + 5
end

def is_interesting(sentence)
  hint_word = %w(is are was were)
  hint_word.any? { |w| sentence.include? w }
end

def extract_summary(contents, stats)
  average = stats[:words_per_sentences]
  summary = contents.split(".").select { |s| is_of_average_size(s, average) && is_interesting(s) }
  summary.map { |sentence| sentence.delete! "\n" }
end

def analyze(filename)
  stats = {}
  stats[:name] = filename

  contents = open_and_read(filename)

  #count
  stats[:lines] = count_lines contents
  stats[:full_lenght] = count_total_lenght contents
  stats[:length] = count_length contents
  stats[:words] = count_words contents
  stats[:sentences] = count_sentences contents
  stats[:paragraphs] = count_paragraphs contents
  stats[:useful_words] = count_useful_words contents

  #compute
  stats[:words_per_sentences] = compute_word_per_sentences stats
  stats[:sentences_per_paragraphs] = compute_sentences_per_paragraphs stats
  stats[:usefulness] = compute_usefulness stats

  #summary
  stats[:summary] = extract_summary(contents, stats)

  #return
  stats
end

def print_file_stats(stats)
  puts "File analyzed : #{stats[:name]}"
  puts "Nb lines : #{stats[:lines]}"
  puts "Nb words : #{stats[:words]}"
  puts "Nb chars total : #{stats[:full_lenght]}"
  puts "Nb chars without blanks : #{stats[:length]}"
  puts "Nb sentences : #{stats[:sentences]}"
  puts "Nb paragraphs : #{stats[:paragraphs]}"
  puts "Average number of words per sentences : #{stats[:words_per_sentences]}"
  puts "Average number of senteces per paragraphs : #{stats[:sentences_per_paragraphs]}"
  puts "Nb of useful words : #{stats[:useful_words]}"
  puts "Percentage of useful text : #{stats[:usefulness]}"
  puts
  puts "Summary : #{stats[:summary].join("\n")}"
end

#puts open_and_read "oliver.txt"
print_file_stats analyze "oliver.txt"

