require 'byebug'
#Phase 1 O(n^2)
def my_min(array)
  lowest = array.first
  # debugger
  array.each_with_index do |num1, idx1|
    array.each_with_index do |num2, idx2|
      if idx1 < idx2
        case num1 <=> num2 
        when -1 
          lowest = num1 if lowest > num1
        when 0 
          next 
        when 1 
          lowest = num2 if lowest > num2
        end 
      end 
    end
  end 
  lowest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

# phase 2 O(n)
def my_min(array)
  lowest = array.first
  array.each do |num|
    lowest = num if num < lowest
  end
  lowest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

#Phase 1 is O(n^2) #=> 2(n^2) + n
def contiguous_sum(arr)
  result = []

  i = 0
  while i < arr.length
    j = 0
    while j < arr.length
      result << arr[i..j]
      j += 1
    end
    i += 1
  end
  
  sum_arr = []
  result.each do |sub_arr|
    sum_arr << sub_arr.reduce(:+) if sub_arr != []
  end 
  sum_arr.max
end

list = [5, 3, -7]
p contiguous_sum(list) # => 8

#Phase 2 is O(n) time and O(1) memory
def continguous_sum(list)
  sum = 0
  list.each do |num|
    next if num < 0
    sum += num
  end
  sum 
end

list = [5, 3, -7]
p contiguous_sum(list) # => 8