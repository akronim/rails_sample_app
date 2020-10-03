class Test

  # Hashes don’t generally guarantee keeping their elements in a particular order.
  # If order matters, use an array.
  def initialize
    method_1
    method_2
    method_3
    method_4
    method_5
  end

  def method_1
    user = {} # {} is an empty hash.

    user["first_name"] = "Michael" # Key "first_name", value "Michael"

    user["last_name"] = "Hartl" # Key "last_name", value "Hartl"

    pp user["first_name"] # Element access is like arrays.

    pp user # A literal representation of the hash
  end

  # using => , called a “hashrocket”
  def method_2
    user = { "first_name" => "Michael", "last_name" => "Hartl" }
    pp user
  end

  # using symbols - kind of like strings, but prefixed with a
  # colon instead of surrounded by quotes
  def method_3
    puts :name

    user = { :name => "Michael Hartl", :email => "michael@example.com" }
    pp user

    puts user[:name]
    puts user[:password] # nil

    # a new syntax
    h2 = { name: "Michael Hartl", email: "michael@example.com" }
    puts user == h2
  end

  # Nested hashes
  def method_4
    params = {} # Define a hash called 'params' (short for 'parameters').

    params[:user] = { name: "Michael Hartl", email: "mhartl@example.com" }

    pp params

    pp params[:user][:email]
  end

  def method_5
    flash = { success: "It worked!", danger: "It failed." }
    flash.each do |key, value|
      puts "Key #{key.inspect} has value #{value.inspect}"
    end
  end
end

Test.new
