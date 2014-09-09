def shuffle_word(a_word)
  #TODO: refactor this method
  a_word.upcase.chars.to_a.shuffle

end

def find_divisors(n)
  (2..n-1).select {|k| n % k == 0 }
end

def is_prime?(n)
  find_divisors(n).count == 0
end

def quote_prime_numbers(n)
  #TODO: refactor this method
  primes = (1..n).find_all {|i| is_prime? i }

  primes.map{ |prime_num| "#{prime_num} is prime"}
end