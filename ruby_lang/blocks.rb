class Test
  def initialize
    method_1
    method_2
    method_3
    method_4
    method_5
    method_6
    method_7
  end

  def method_1
    (1..5).each { |i| puts 2 * i }
  end

  def method_2
    (1..5).each do |i|
      puts 2 * i
    end
  end

  def method_3
    (1..5).each do |number|
      puts 2 * number
      puts "--"
    end
  end

  def method_4
    3.times { puts "Betelgeuse!" } # 3.times takes a block with no variables.
  end

  # map method returns the result
  def method_5
    a_1 = (1..5).map { |i| i**2 } # The ** notation is for 'power'.
    pp a_1
  end

  # map method returns the result
  def method_6
    a_1 = %w[a b c].map { |char| char.upcase }
    a_2 = %w[A B C].map { |char| char.downcase }

    pp a_1
    pp a_2

    # shorthan
    a_3 = %w[A B C].map(&:downcase)
    pp a_3
  end

  def method_7
    a_1 = ('a'..'z').to_a.shuffle[0..7].join
    pp a_1

    # An alphabet array
    # Shuffle it
    # Pull out the first eight elements.
    # Join them together to make one string.
  end
end

Test.new
