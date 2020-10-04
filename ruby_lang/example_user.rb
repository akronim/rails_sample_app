class ExampleUser
  # This creates “getter” and “setter” methods that allow us to
  # retrieve (get) and assign (set) @name and @email instance variables
  # (When using Rails we don’t need to identify the attributes explicitly.)
  attr_accessor :name, :email

  # gets called when we execute ExampleUser.new
  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end

  # a class method
  def self.class_method
    puts "Hello from ExampleUser Class"
  end

  # an instance method
  def instance_method
    puts "Hello from an instance of ExampleUser Class"
  end
end

example = ExampleUser.new

# assignments made possible by the attr_accessor line
example.name = "Example ExampleUser"
example.email = "user@example.com"

puts example.formatted_email

user = ExampleUser.new(name: "Michael Hartl", email: "mhartl@example.com")
puts user.formatted_email

# call the class method
ExampleUser.class_method

# call the instance method of the new object
user.instance_method


class ClassB
  def initialize
    ExampleUser.class_method
    ExampleUser.new.instance_method
  end
end

ClassB.new