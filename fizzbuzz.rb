require 'rubygems'
require 'shen_ruby'

shen = ShenRuby::Shen.new

class << shen
	#add a function to std shen library which returns true if b divides evenly into a
	def divides?(a,b)
		b % a == 0
	end
end

# Implement the fizz-buzz function in Shen
shen.eval_string <<-EOS
  (define fizz-buzz
    X -> "Fizz Buzz" where (and (divides? 3 X)
                               (divides? 5 X))
    X -> "Fizz" where (divides? 3 X)
    X -> "Buzz" where (divides? 5 X)
    X -> (str X))
	(define fib 
		
		)
EOS

20.times{|i|
 puts shen.fizz_buzz(i)
}