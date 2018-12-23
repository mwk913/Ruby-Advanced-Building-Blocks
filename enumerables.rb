module Enumerable

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
   arr = []
    self.my_each do |i|
        arr << if yield(i)
      end
     arr
    end
  end

  def my_all?
    self.my_each do |i|
      return false unless yield(i)
    end
    true
  end

  def my_any?
  self.my_each do |i|
      return true if yield(i) 
    end
    false
  end

  def my_none?
    self.my_each do |i|
      return false if yield(i) 
    end
    return true
  end

  def my_count(arg=nil)
    nums = []
    if block_given?
      self.my_each do |i|
        nums << yield(i)
      end
      p nums
    elsif arg != nil
      self.my_select do |i|
        nums.push(arg) if arg == i
      end
      p nums.length
    else
      p self.length if arg == nil
    end
  end

  def my_map(&proc)
    arr = []
    self.my_each do |item|
      if proc.nil?
        arr << proc.call(item)
      else
        arr << yield(item)
      end
    end
    return arr
  end

 def my_inject(nums = nil)
    if nums == nil
      nums = self[0]
    end
      0.upto(self.length-1) { |i| nums = yield(nums, self[i]) }
    nums
  end
      
end

def multiply_els(arr)
  arr.my_inject { |total, i| total * i }
end

multiply_els([11,4,5,6])

