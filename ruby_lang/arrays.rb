# comment
class Test
  def initialize
    puts "foo bar baz".split # Split a string into a three-element array.

    puts "fooxbarxbazx".split("x")

    a = [42, 8, 17]
    puts a[0]

    puts a.first
    # puts a.second
    puts a.last
    puts a.last == a[-1]

    x = a.length
    puts x == 3

    puts a.empty?
    puts a.include?(42)

    a_reversed = a.reverse
    pp a
    pp a_reversed

    a_shuffled = a.shuffle
    pp a
    pp a_shuffled

    # To mutate the array, use the corresponding “bang” methods
    a.sort!
    pp a

    a.push(6) # Pushing 6 onto an array
    pp a

    a << 7 # Pushing 7 onto an array
    pp a

    # Ruby arrays can contain a mixture of different types
    a << "foo" << "bar" # Chaining array pushes
    pp a

    # ranges
    pp (0..9).to_a # Use parentheses to call to_a on the range


    a = %w[foo bar baz quux] # Use %w to make a string array.
    pp a

    pp a[0..2]

    a = (0..9).to_a
    pp a[2..(a.length-1)] # Explicitly use the array's length.
    pp a[2..-1] # Use the index -1 trick.

    pp ('a'..'e').to_a
  end

  def method_2  
    addresses = %w[USER@foo.COM THE_US-ER@foo.bar.org first.last@foo.jp]
    pp addresses

    addresses.each do |address|
      puts address
    end
  end
end

Test.new
