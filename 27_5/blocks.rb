def demonstrate_block(number)
  yield(number)
end

puts demonstrate_block(1) { |number| number + 1 }