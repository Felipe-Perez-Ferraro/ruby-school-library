def user_input(type)
  result = gets.chomp
  result = result.to_i if type == 'int'
  result
end
