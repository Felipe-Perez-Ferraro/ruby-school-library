require_relative 'app'

def menu
  puts 'Please select an option'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  print 'Enter your option: '
end

def main
  app = App.new
  puts 'Welcome to School Library'
  loop do
    menu
    option = gets.chomp.to_i
    break if option == 7

    app.run(option)
  end
  puts 'Thanks for using our app'
end

main
