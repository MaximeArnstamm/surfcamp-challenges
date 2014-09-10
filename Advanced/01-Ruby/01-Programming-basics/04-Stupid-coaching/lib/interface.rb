require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.

answer = "init"
while !answer.empty?
  question = gets.strip
  answer = coach_answer question
  puts answer
end