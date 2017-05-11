

fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'fiiiissshhhhhh', 'ffiiiiisshh', 'fsh']

def sluggish(fishes)

  fishes.each_with_index do |fish, i|
    longest_fish = true

    fishes.each_with_index do |fish2, i2|
      next if i == i2
      longest_fish = false if fish.length < fish2.length
    end

    return fish if longest_fish
  end


end

# p sluggish(fish_arr)

class Array

  def merge_sort(&prc)
    return self if self.length < 2

    prc ||= Proc.new { |x, y| x <=> y }

    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 1
        merged << left.shift
      when 0
        merged << left.shift
      when -1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end

end

def dominant(fishes)
  prc = Proc.new { |x, y| x.length <=> y.length }
  fishes.merge_sort(&prc).first
end

# p dominant(fish_arr)

def clever(fishes)
  longest_fish = fishes.first
  fishes.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

# p clever(fish_arr)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles)
  tiles.each_with_index do |tile, i|
    return i if tile == direction
  end
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

tiles_hash = {
  "up" => 0,
  "right_up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, tiles)
  tiles[direction]
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)















#
