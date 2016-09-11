class Object
  def salute
    puts "TEST #{self.class}"
  end

  def self.say something
    define_method "say_#{something}".to_sym do
      something.upcase
    end
  end
end

"STRING".salute

class Fixnum
	def +(number)
		rand * number
	end
end

puts 12 + 4

class Dummy  
	def method_missing m, *args, &block
    puts "The args are in an: #{args.class}"
    puts "You've sent: #{args.size} parameters"
    puts "The first one is: #{args[0]}"
    puts "There's no method called #{m} here -- please try again."
	end
end

Dummy.new.whaaaat

class MagicObject
	def initialize
		@data = {}
	end

	def method_missing m, *args, &block
		if args.size > 0
			@data[m] = args[0]
		else
			@data[m]
		end
	end
end

m = MagicObject.new
m.thing 2
puts m.thing

string = 'Hi, I am a string'
puts string.send :reverse

class A
  say :yeah
end

puts A.new.say_yeah

def accessor attribute_name
  define_method attribute_name.to_sym do
    instance_variable_get "@#{attribute_name}".to_sym
  end

  define_method "#{attribute_name}=".to_sym do |value|
    instance_variable_set "@#{attribute_name}".to_sym, value
  end
end

class Thing
  accessor :attribute
end

t = Thing.new
t.attribute = 'value'
puts t.attribute

class B
  def method_missing m, *args, &block
    m
  end

  def self.shoutable name
    define_method "shout_#{name}".to_sym do
      send(name.to_sym).to_s.upcase.send :reverse
    end
  end

  shoutable :yeah
end

puts B.new.shout_yeah
