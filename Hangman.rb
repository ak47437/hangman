 def draw_man(body_parts)
      puts "      ________"
      puts "      |      |"
    if body_parts >= 1
      puts "      |      @"
    else
      puts "      |"
    end
    if body_parts >= 2
      puts "      |      |"
    else
      puts "      |"
    end
  if body_parts == 3
      puts "      |    --|"
    elsif body_parts >= 4
      puts "      |    --|--"
    else
      puts "      |"
    end
    if body_parts == 5
      puts "      |      |"
      puts "      |     /"
      puts "      |    /"
    elsif body_parts >= 6
      puts "      |      |"
      puts "      |     / \\"
      puts "      |    /   \\"
    else
      puts "      |"
    end
      puts "      |"
      puts "______|_______"
  end

  guesses = []
#Create a variable that stores number of wrong guesses
  n = 0
 available = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]


  def display_result(word_played, guesses, guess)	
	result = []
	word_played.each do |let|
      if guesses.include?(let)
        result.push(let)
      else
        result.push("_")
      end
    end
	result.join(' ')
  end

def check_letter(word_played, guess)
	word_played.include?(guess)
end

  f = File.open("common_words.txt", "r")
  word_played = f.readlines.sample
  word_played = word_played.split('')

system("clear")

#game
while true
	puts "Guess a letter"
	guess = gets.chomp
	guesses.push(guess)
	guesses.each do |g|
		if guess == g
			puts "You already guessed that letter"
		end
	end
	if check_letter(word_played, guess) == false
		n += 1
	end
	if display_result(word_played, guesses, guess) == word_played
		available.delete(guess)
		system("clear")
		draw_man(n)
		puts "Guessed #{guesses.join(', ')}"
		puts "Letters available #{available.join(', ')}"
		puts display_result(word_played, guesses, guess)
		puts "WINNER!"
		exit
	end
   if n == 7
     available.delete(guess)
	system("clear")
	draw_man(n)
	puts "Guessed: #{guesses.join(', ')}"
	puts "Letters to guess: #{available.join(', ')}"
	puts display_result(word_played, guesses, guess)
	puts "GAME OVER"
	puts "The answer was #{word_played.join('')}"
     exit
   end
	if guess == "exit"
		exit
	end
   available.delete(guess)
   system("clear")
   draw_man(n)
   puts "Guessed: #{guesses.join(', ')}"
   puts "Letters to guess: #{available.join(', ')}"
   puts display_result(word_played, guesses, guess)
end

