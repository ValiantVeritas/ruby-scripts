# Implement the fizz-buzz function in Shen 
shen.eval_string <<-EOS 
	(define fizz-buzz 
		X -> "Fizz Buzz" where (and (divides? 3 X) 
									(divides? 5 X)) 
		X -> "Fizz" where (divides? 3 X) 
		X -> "Buzz" where (divides? 5 X) 
		X -> (str X)) 
EOS