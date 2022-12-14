# frozen_string_literal: true

require 'colorize'
require 'tty-box'
require 'Date'

# the ToDoListApp class is for the method to make a todo list #
class ToDoListApp
  def initialize
    @date = ''
    @tasks = []
  end

  def get_task
    puts 'Enter your tasks here'
    task = STDIN.gets.chomp
    until task.length > 0
      puts 'No tasks!! Please enter your task.'.colorize(:red)
      task = STDIN.gets.chomp
    end
    @tasks.push(task)

    ask = 'Do you want to add more tasks? y/n'.colorize(:blue)
    puts ask
    answer = STDIN.gets.chomp
    if answer != "y" || answer != 'n'
      until answer == 'y' || answer == 'n'
        puts "Please enter 'y' or 'n'".colorize(:red)
        answer = STDIN.gets.chomp
      end
    elsif answer == 'n'
    puts ' '
    end

    if answer == 'y'
      until answer == 'n'
        puts 'Added your tasks'.colorize(:blue)
        @task = @tasks.push(STDIN.gets.chomp)
        puts ask
        answer = STDIN.gets.chomp
        if answer != "y" && answer != 'n'
          loop do
            puts "Please enter 'y' or 'n'".colorize(:red)
            answer = STDIN.gets.chomp
            break if answer == 'y' || answer == 'n'
          end
        end
      end
    end
    puts 'Added your tasks successfully!!'.colorize(:green)
    puts ' '
  end

  def ask_date
    puts 'Please enter a date for your todo list (4/23 etc)'.colorize(background: :blue)
    @date = STDIN.gets.chomp
    Date.parse(@date)

  rescue StandardError
    puts 'enter correct format'.colorize(:red)
  retry
  end


  def title_with_date
    puts '--------------------'
    puts "TODO DATE: #{@date}".colorize(background: :green)
    puts '--------------------'
  end

  def tasks
    if @tasks.length >= 1
      begin
        @tasks.each_with_index do |task, index|
          puts "#{index + 1}: #{task}"
      end
      rescue StandardError
        puts 'Failed to get arguments from the terminal command line.'.colorize(:red)
      end
      puts ' '
    else
      puts 'No tasks!! Add tasks in the command line!'.colorize(:red)
      puts ' '
      exit!
    end
  end

  def feedback
    puts 'How many tasks have you completed? Answer as a number. e.g: 2'.colorize(background: :blue)
    num = 0

    loop do
      get_num = $stdin.gets.chomp
      num = get_num.to_i

      break if get_num =~ (/^[0-9]+$/) && num <= @tasks.length

      puts 'Please enter the right number'.colorize(:red)
    end

    left_tasks = @tasks.length - num

    if left_tasks.zero?
      print TTY::Box.frame 'Feedback: Completed all the tasks!', align: :center
    else
      print TTY::Box.frame "Feedback: You completed #{num} tasks, and have #{left_tasks} more tasks!", align: :center
    end
  end
end
