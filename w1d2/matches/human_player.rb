class HumanPlayer
  def initialize(name = "Foo", default_size)
    @name = name
  end

  def make_guess
    puts "Make guess"
    guess = gets.chomp

    guess.split(",").map(&:to_i)
  end
end
