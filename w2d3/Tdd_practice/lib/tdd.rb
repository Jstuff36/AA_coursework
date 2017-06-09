def my_uniq(arr)
  result_hash = {}
  arr.each {|num| result_hash[num] = nil}
  result_hash.keys
end

class Array
  def two_sum
    arr = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        arr << [i,j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    arr
  end

  def my_transpose
    arr = []
    self.each_index do |x|
      temp_arr = []
      self.each_index do |y|
        temp_arr << self[y][x]
      end
      arr << temp_arr
    end
    arr
  end
end

def stock_picker(arr)
  largest_diff = []
  total = 0
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      if arr[j] - arr[i] > total
        largest_diff = [i,j]
        total = arr[j] - arr[i]
      end
      j += 1
    end
    i += 1
  end
  largest_diff
end
