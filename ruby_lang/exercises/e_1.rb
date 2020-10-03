def string_shuffle(s)
  s.split("").shuffle.join
end

puts string_shuffle("foobar")

class String
  def shuffle
    self.split("").shuffle.join
  end
end

puts "foobar".shuffle

person1 = { :first => "Mirko", :last => "Spirko" }
person2 = { :first => "Ava", :last => "Spirko" }
person3 = { :first => "Ante", :last => "Spirko" }

params = {}
params[:father] = person1
params[:mother] = person2
params[:child] = person3

puts params[:father][:first]
puts params[:mother][:first]
puts params[:child][:last]

res = { "a" => 100, "b" => 200 }.merge({ "b" => 300 })

puts res.inspect