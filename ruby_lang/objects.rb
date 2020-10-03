# comment
class Test
  def initialize
    object_rb
  end

  def object_rb
    puts "foobar".length

    puts "foobar".empty?

    puts "".empty?

    s = "foobar"
    if s.empty?
      puts "The string is empty"
    else
      puts "The string is nonempty"
    end
    # "The string is nonempty"

    if s.nil?
      puts "The variable is nil"
    elsif s.empty?
      puts "The string is empty"
    elsif s.include?("foo")
      puts "The string includes 'foo'"
    end
    # "The string includes 'foo'"

    x = "foo"
    y = ""
    puts "Both strings are empty" if x.empty? && y.empty?
    puts "One of the strings is empty" if x.empty? || y.empty?
    puts "x is not empty" if !x.empty?

    puts nil.to_s

    puts nil.to_s.empty?  # Message chaining

    puts "foo".nil?

    puts "".nil?

    puts nil.nil?

    string = "foobar"
    puts "The string '#{string}' is nonempty." unless string.empty?

    # the only Ruby object that is false in a boolean context
    puts !!nil # false

    # all other Ruby objects are true
    puts !!0
  end
end

Test.new
