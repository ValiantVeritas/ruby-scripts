def guessing_game()
	
	num = rand(1..100)
	puts "I am thinking of a number between 1 and 100. You have 10 guesses \ntype in your first guess:"


	for i  in 1..10 

		print "guess number #{i} :"
		guess = gets.chomp
		guess = guess.to_i

		if guess > num then
			puts "guess is too high"
		end

		if guess < num then 
			puts "guess is too low"
		end

		if guess == num then
			puts "YOU WIN the number was #{num}"
			puts "would you like to play again/nyes o"

			if gets.chomp == "yes" then
				guessing_game()
			else
				puts "Goodbye"
				return
			end
		end
	end

	puts "sorry you lose the number was #{num}"
	puts "would you like to play again \n(yes or no) "

	if gets.chomp == "yes" then
		guessing_game()
	else
		puts "goodbye"
		return
	end
end

guessing_game()


