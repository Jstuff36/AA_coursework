fishys = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#quad search

def quadratic_fishys(fishys)
  biggest_fish_length = 0
  fishys.each_with_index do |fish, i|
    found_max_length = true
    fishys.each_with_index do |other_fish, j|
      next if i == j
      found_max_length = false if other_fish.length > fish.length
    end
    return fish if found_max_length
  end
end

#merge sort
def merge_sort(&prc)
  #merge sort algorithem goes here
end

def nlogn_fishys(fishys)
  prc = Proc.new {|x,y| x.length<=>y.length}
  fishys.merge_sort(&prc)[-1]
end

def linear_fishys(fishys)
  biggest_fishy = fishys.first
  fishys.each do |fish|
    if fish.length > biggest_fishy.length
      biggest_fishy = fish
    end
  end
  biggest_fishy
end
