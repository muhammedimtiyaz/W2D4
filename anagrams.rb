#phase1   O(n!)
def anagram?(str1, str2)
  anagrams = str1.chars.permutation(str1.length).to_a
  anagrams.map!(&:join).include?(str2)
end 
p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true


#phsae2 O(n^2)
def anagram2?(str1, str2)
  chars1 = str1.chars
  chars2 = str2.chars

  chars1.each do |ch|
    if chars2.find_index(ch)
      chars2.delete_at(chars2.find_index(ch))
    end 
  end 
  chars2.length == 0
end 
p anagram2?("gizmo", "sally")    #=> false
p anagram2?("elvis", "lives")    #=> true


#phase 3 is => 2n(logn) avg, 2(n^2) worst

def anagrams3?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

p anagrams3?("gizmo", "sally")    #=> false
p anagrams3?("elvis", "lives")    #=> true

#phase 4 is O(n)

def anagrams4?(str1, str2)
  hash1 = Hash.new(0)
  str1.each_char do |ch|
    hash1[ch] += 1
  end

  hash2 = Hash.new(0)
  str2.each_char do |ch|
    hash2[ch] += 1
  end

  hash1 == hash2  
end


p anagrams4?("gizmo", "sally")    #=> false
p anagrams4?("elvis", "lives")    #=> true

#Bonus is O(n)

def anagrams5?(str1, str2)
  hash = Hash.new(0)
  str1.each_char do |ch|
    hash[ch] += 1
  end

  str2.each_char do |ch|
    hash[ch] -= 1
  end

  hash.values.all? { |v| v ==0 }
end

p anagrams5?("gizmo", "sally")    #=> false
p anagrams5?("elvis", "lives")    #=> true

