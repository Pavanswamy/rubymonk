def array_copy(source)
  destination = []
  for number in source
    # Add number to destination if number
    # is less than 4
    destination << number if number < 4
  end
  return destination
end