# brute force => O(n^2)
def two_sum?(arr, target)
  arr.each_index do |i|
    ((i+1)...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end 
  end 
  false
end 
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

# sorting O(n log n)
def okay_two_sum?(arr, target)
  sorted = arr.sort

  lowest = 0
  highest = arr.length - 1

  while lowest != highest
    return true if sorted[lowest] + sorted[highest] == target
    if sorted[lowest] + sorted[highest] > target 
      highest -= 1
    elsif sorted[lowest] + sorted[highest] < target
      lowest += 1 
    end 
  end 
  false
end 

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false