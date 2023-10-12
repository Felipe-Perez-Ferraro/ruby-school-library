require './app'

def display_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def handle_user_input(app, response)
  case response
  when '1'
    app.list_books('list')
  when '2'
    app.list_people('list')
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.rental
  when '6'
    app.list_rentals
  else
    app.quit_choose(response)
  end
end

def main
  app = App.new
  response = nil
  puts "Welcome to School Library App!\n\n"
  while response != '7'
    display_menu
    response = gets.chomp
    handle_user_input(app, response)
    puts "\n"
  end
end

main
