# comment
class Test
  def initialize
    method_1
    method_2
  end

  def method_1
    puts "foo" + "bar" # String concatenation

    first_name = "Michael"
    puts "#{first_name} Hartl" # String interpolation

    print "foo" # print string (same as puts, but without the newline)
    print "foo\n" # Same as puts "foo"

    puts "foo" # A single-quoted string

    puts '#{foo} bar' # Single-quoted strings don't allow interpolation

    puts '\n' # A literal 'backslash n' combination

    puts 'Newlines (\n) and tabs (\t) both use the backslash character \.'
  end

  def method_2
    puts "".blank?
    puts "    ".empty?
    puts "    ".blank?
    puts nil.blank?
  end
end

Test.new
