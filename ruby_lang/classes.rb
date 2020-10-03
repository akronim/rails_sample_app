class Test
  def initialize
    method_1
  end

  def method_1
    s = "foobar" # A literal constructor for strings using double quotes
    p s.class

    s_2 = String.new("foobar")
    p s_2.class

    pp s_2 == "foobar"

    a = Array.new([1, 3, 2])
    pp a

    h = Hash.new(0) # Arrange for nonexistent keys to return 0 instead of nil.
    puts h[:foo]
  end

  def method_2
    s = String.new("foobar")
    puts s.class.superclass
    puts s.class.superclass.superclass
    puts s.class.superclass.superclass.superclass # nil
  end
end

Test.new

class Word
  def palindrome?(string)
    string == string.reverse
  end
end

w = Word.new
puts w.palindrome?("foobar")
puts w.palindrome?("level")

class Word_2 < String # Word inherits from String.
  # Returns true if the string is its own reverse.
  def palindrome?
    self == self.reverse # self is the string itself.
  end
end

s = Word_2.new("level")
puts s.palindrome?
puts s.length
puts s.class.superclass

# Modifying built-in classes
class String
  # Returns true if the string is its own reverse.
  def palindrome?
    self == self.reverse
  end
end

puts "deified".palindrome?
