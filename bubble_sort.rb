def bubble_sort(arr)
  
  indices = (arr.length - 1)

  loop do
    sorted = true
    indices.times do |index|
      if arr[index] > arr[index+1]
       arr[index], arr[index+1] = arr[index+1], arr[index]
          p arr[0..-1] #SHOWS SWAPPING
        sorted = false
      end
    end
    break if sorted == true
  end
  puts "====SORTED===> " + arr.uniq.join("-") 
end

def bubble_sort_by(arr)
 array_length = (arr.length - 1)

  loop do
    sorted = true
    array_length.times do |index|
        if yield(arr[index], arr[index + 1]) < 0
       arr[index], arr[index+1] = arr[index+1], arr[index]
        p arr[0..-1]
        sorted = false
      end
    end
    break if sorted == true
  end
  puts "====SORTED===> " + arr.join(", ")
end
#RANDOM NUMS AND WORDS FOR ABOVE METHODS
def random_array(num_of_index)
  nums = []
  num_of_index.times {nums.push(rand(1..25))}
  return nums
end 

def random_words(num_of_words)

  dictionary = ["Python","Ruby","CSS","HTML","Programming","Rails","Java",
  "JavaScript","Apple","Microsoft","Gates","Jobs","Hackers","GO","C++","C#",
  "Google","Netscape","Runescape","Tetris","Pac-Man" ]
  
  too_many_words = ["Too", "Many", "Words"]
  
  dictionary.shuffle!

    if num_of_words > 2 && num_of_words <= 10
      num_of_words.times do
        return dictionary[0..(num_of_words-1)]
      end
    else
      return too_many_words
    end

end
#END RANDOM NUMS AND WORDS
puts "**********Sort BY NUMS"

bubble_sort(random_array(rand(2..15)))

puts " "
puts " "
puts " "
puts " "
puts "**********SORT BY WORDS"

bubble_sort_by(random_words(2..8)) do |left, right|
  right.length - left.length
end

