require 'pry'
# use .length -1 to find total number of options.
# add shovels new answers it on to the end of an array.
#

@answer_arr = ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes, Definitely',
              'You may rely on it', 'As I see it, yes', 'Most likely', 'Outlook good',
              'Yes', 'Signs point to yes', 'Reply Hazy try again', 'Ask again later',
              'Better not tell you now', 'Connot predict now', 'Concentrate and ask again',
              'Don\'t count on it', 'My reply is no', 'My sources say no', 'Outlook not so good',
              'Very Doubtful']

question = -> do
  puts 'Ask the magic 8 ball a yes or no question. Type \'quit\' to quit.'
  gets.strip
end

def controller(question)
  case question.call
  when "add_answers"
    add_answers
  when "quit"
    exit 0
  when "print_answers"
    print_answers
  when "reset_answers"
    reset_answers
  else
    random_answer
  end
  controller(question)
end

def reset_answers
  @answer_arr = ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes, Definitely',
                'You may rely on it', 'As I see it, yes', 'Most likely', 'Outlook good',
                'Yes', 'Signs point to yes', 'Reply Hazy try again', 'Ask again later',
                'Better not tell you now', 'Connot predict now', 'Concentrate and ask again',
                'Don\'t count on it', 'My reply is no', 'My sources say no', 'Outlook not so good',
                'Very Doubtful']
  puts "Answers have been reset"
end


def print_answers
  @answer_arr.each { |ans| puts ans }
end

def add_answers
  while true
    puts 'Congrats! please add your new answer. Type \'quit\' to return to the 8ball'
    answer = gets.strip
    break if answer == 'quit'
    if @answer_arr.include?(answer)
      puts "That's already in there"
    else
      puts "Putting #{answer} in the 8 ball"
      @answer_arr << answer
    end
  end
end

def random_answer
  puts @answer_arr[rand(@answer_arr.length - 1)]
end

first_arg = ARGV[0].strip if ARGV[0]
ARGV.clear

if first_arg == "add_answers"
  add_answers
  controller(question)
else
  controller(question)
end
