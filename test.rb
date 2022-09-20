require 'Date'


#1. ask a question.
#2. user reply with string.
#3. check if string can be a date
#4. oh no string can't be a date. i need to raise an error
#5. rescue will tell user what is wrong
#6. retry will go back to #1

# begin
# puts "1. which date?"
# answer = gets.chomp
# answer_date_format = Date.parse(answer)

# rescue
#   puts 'enter correct format'
# retry

# end

# puts answer_date_format

def ask_date
    puts 'Please enter a date for your todo list (4th May, 5月23日 etc)'.colorize(background: :blue)
    @date = STDIN.gets.chomp
    puts @date
   raise 'wrong format' unless /\d\d/\d\d/\d\d\d\d/.match?@date
   raise 'wrong format no letters' if /[a-zA-Z]+/.match?@date
  rescue StandardError
    puts 'enter correct format'.colorize(:red)
  retry
  end
end

data = data.ask_date