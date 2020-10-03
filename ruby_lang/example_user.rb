class User
  # This creates “getter” and “setter” methods that allow us to
  # retrieve (get) and assign (set) @name and @email instance variables
  attr_accessor :name, :email

  # gets called when we execute User.new
  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end

example = User.new

# assignments made possible by the attr_accessor line
example.name = "Example User"
example.email = "user@example.com"

puts example.formatted_email

user = User.new(name: "Michael Hartl", email: "mhartl@example.com")
puts user.formatted_email
