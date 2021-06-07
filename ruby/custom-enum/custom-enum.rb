module Enumerable
  def my_each
    return self.to_enum(:my_each) unless block_given?

    for i in self do
      yield(i)
    end

    self
  end

  def my_each_with_index
    return self.to_enum(:my_each_with_index) unless block_given?
    i = 0
    for v in self do
      yield(v, i)
      i += 1
    end

    self
  end

  def my_select
    return self.to_enum(:my_select) unless block_given?

    arr = []
    for v in self do
      arr << v if yield(v)
    end

    return arr
  end

  def my_all?
    return true unless block_given?

    for v in self do
      return false unless yield(v)
    end

    true
  end

  def my_any?
    return self != [] unless block_given?

    for v in self do
      return true if yield(v)
    end

    false
  end

  def my_none?
    return self == [] unless block_given?

    for v in self do
      return false if yield(v)
    end

    true
  end

  def my_count(*value)
    # raise ArgummentError if value.size > 1

    c = 0

    if value == []
      return self.size unless block_given?

      for v in self do
        c += 1 if yield(v)
      end

      return c
    end

    for v in self do
      c += 1 if v == value[0]
    end

    c
  end

  def my_map
    return self.to_enum(:my_map) unless block_given?
    arr = []
    (self.size).times do |i|
      arr[i] = yield(self[i])
    end

    arr
  end

  def my_inject(init_value = nil)
    raise LocalJumpError unless block_given?
    result = init_value.nil? ? self[0] : yield(init_value, self[0])

    for v in self[1..-1] do
      result = yield(result, v)
    end

    result
  end

end

def multiply_els(arr)
  raise ArgummentError unless arr.is_a? Array

  arr.my_inject(&:*)
end
=begin
# test
puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
numbers.each  { |item| puts item }

puts "my_each_with_index vs. each_with_index"
numbers = [1, 2, 3, 4, 5]
numbers.my_each_with_index  { |item, index| puts [item, index]*' at: ' }
numbers.each_with_index  { |item, index| puts [item, index]*' at: ' }

puts 'my_select vs. select'
numbers = [1, 2, 3, 4, 5]
p numbers.my_select { |item| item >= 3 }
p numbers.select { |item| item >= 3 }

puts 'my_count vs. count'
numbers = [1, 2, 3, 4, 5]
# p numbers.my_count(2)
# p numbers.count(2)

puts 'my_map vs. map'
numbers = [1, 2, 3, 4, 5]
p numbers.my_map { |item| item.to_s }
p numbers.map { |item| item.to_s }

puts 'my_inject vs. inject'
numbers = [1, 2, 3, 4, 5]
p numbers.my_inject(2) { |s, item| s *= item }
p numbers.inject(2) { |s, item| s *= item }
puts 'multiply_els'
p multiply_els(numbers[1..3])
=end
