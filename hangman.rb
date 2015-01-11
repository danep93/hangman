Alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
rightLetters = []
wrongLetters = []
allWords = IO.readlines('words.txt')

for i in 0...allWords.length
        allWords[i] = allWords[i].downcase.chomp
end

puts "Welcome to Hangman!"
puts "Enter 1 to play with a word of your choosing -- It has to be real!"
puts "Enter 2 to play with a randomly selected word from our dictionary"


choice = gets.to_i
if (choice == 1)
        while(1)
                puts "Enter your word!"
                word = gets.downcase.chomp
                if(allWords.include?(word))
                        break
                else
                        puts "Not a valid word, try again!"
                end
        end
else
        word = allWords.sample.downcase
end
wordArr = word.split(//)
puts "Your word is #{word.length} letters long, how many lives to do want?"
lives = gets.to_i
puts "Let us begin with the hanging of the man\n\n\n\n"
until lives == 0 || rightLetters.length == wordArr.uniq.length
        puts "Lives Remaining: #{lives}"
        puts "Wrong Letters Bank: "
        wrongLetters.each{|let| print "#{let} "}
        print "\n"
        puts "Correct Guesses: "
        for i in 0...wordArr.length
                if rightLetters.include?(wordArr[i])
                        print "#{wordArr[i]} "
                else
                        print "_ "
                end
        end
        print "\n"
        puts "Enter your next guess"
        guess = gets.downcase.chomp
        if (guess.length != 1 || Alphabet.include?(guess) == false)
        puts "Not a valid guess, try again"
        next
    elsif wrongLetters.include?(guess) || rightLetters.include?(guess)
        puts "Not valid . . . You already guessed that letter! \n////////////////////\n\n\n"
    else
                if (wordArr.include?(guess))
                        puts "What a good guess! \n////////////////////\n\n\n"
                        rightLetters.push(guess)

                else
                        puts "What a bad guess \n////////////////////\n\n\n"
                        wrongLetters.push(guess)
                        lives = lives - 1
                end
        end
end

if lives != 0
        puts "Congratulations . . . YOU WIN!!"
else
        puts "You lose, the correct word was #{word}"
end


