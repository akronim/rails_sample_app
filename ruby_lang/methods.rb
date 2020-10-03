# comment
class Test
  def initialize
    puts string_message("foobar")
    puts string_message("")
    puts string_message
  end

  # Ruby functions have an implicit return
  # - they return the last statement evaluated
  def string_message(str = "")
    if str.empty?
      "It's an empty string!"
    else
      # explicit return option
      return "The string is nonempty."
    end
  end
end

Test.new
