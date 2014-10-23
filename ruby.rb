###########

#example method for controller or model
  def say_goodnight(name)
		result = 'Good night, ' + name return result
	end
	# Time for bed...
	# puts say_goodnight('Mary-Ellen') # => 'Goodnight, Mary-Ellen' 
	# puts say_goodnight('John-Boy') # => 'Goodnight, John-Boy'

	def say_goodnight(name)
		"Good night, #{name.capitalize}"
	end
	puts say_goodnight('pa')

#You can create and initialize a new array object using an array literal—a set
#of elements between square brackets. Given an array object, you can access
#individual elements by supplying an index between square brackets, as the
#next example shows. Ruby array indices start at zero.
	a = [ 1, 'cat', 3.14 ] 
	a[0]
	a[2] = nil
	# array with three elements
	# access the first element (1)
	# set the third element
	# array now [ 1, 'cat', nil ]

#The method <<() is commonly used with arrays. It appends a value to its receiver.
ages = []
for person in @people
  ages << person.age
end

#Ruby has a shortcut for creating an array of words:
a = [ 'ant', 'bee', 'cat', 'dog', 'elk' ] # this is the same:
a = %w{ ant bee cat dog elk }

=begin
Ruby hashes are similar to arrays. A hash literal uses braces rather than
square brackets. The literal must supply two objects for every entry: one for
the key, the other for the value. For example, you may want to map musical
instruments to their orchestral sections:
=end

inst_section = {
	:cello => 'string', 
	:clarinet => 'woodwind', 
	:drum => 'percussion', 
	:oboe => 'woodwind', 
	:trumpet => 'brass', 
	:violin => 'string'
}

#or
inst_section = {
	cello: 'string', 
	clarinet: 'woodwind', 
	...
} #Obviously you’ll need to use the arrow syntax whenever the key is not a symbol.

#Hashes are indexed using the same square bracket notation as arrays:
inst_section[:oboe] #=> 'woodwind' 
inst_section[:cello] #=> 'string' 
inst_section[:bassoon] #=> nil

#You can pass hashes as parameters on method calls. Ruby allows you to omit
#the braces, but only if the hash is the last parameter of the call. Rails
#makes extensive use of this feature. The following code fragment shows a two-
#element hash being passed to the redirect_to() method. In effect, though, you
#can ignore that it’s a hash and pretend that Ruby has keyword arguments.
redirect_to action: 'show', id: product.id

#Regular Expressions
if line =~ /P(erl|ython)/
	puts "There seems to be another scripting language here"
end

#Control Structures
if count > 10
	puts "Try again"
elsif tries == 3 
	puts "You lose"
else
	puts "Enter a number" 
end

#Similarly, while statements are terminated with end:
while weight < 100 and num_pallets <= 30 
	pallet = next_pallet()
	weight += pallet.weight
	num_pallets += 1
end

#or
puts "Danger, Will Robinson" if radiation > 3000 
distance = distance * 1.2 while distance < 100


#Blocks and Iterators
{ puts "Hello" } do
  club.enroll(person)
  person.socialize
end
# this is a block
###
  # and so is this
  #
###

#method
def greet
	greet { puts "Hi" }
end
#If a method call has parameters, they appear before the block:
verbose_greet("Dave", "loyal customer") { puts "Hi" }
#A method can invoke an associated block one or more times using the Ruby
#yield statement.


animals = %w( ant bee cat dog elk ) # create an array
animals.each {|animal| puts animal }# iterate over the contents

#Each integer N implements a times() method, which invokes an associated block
#N times:
3.times { print "Ho! " } #=> Ho! Ho! Ho!

#The & prefix operator will allow a method to capture a passed block as a
#named parameter.
def wrap &b
	print "Santa says: " 
	3.times(&b)
	print "\n"
end
wrap { print "Ho! " }

# Within a block, or a method, control is sequential except when there is an exception.

#Exceptions Both methods and blocks of code wrapped between begin and end
#keywords intercept certain classes of exceptions using rescue clauses.
begin
	content = load_blog_data(file_name) 
rescue BlogDataNotFound
	STDERR.puts "File #{file_name} not found" 
rescue BlogDataFormatError
	STDERR.puts "Invalid blog data in #{file_name}" 
rescue Exception => exc
	STDERR.puts "General error loading #{file_name}: #{exc.message}" 
end
#rescue clauses can be directly placed on the outermost level of a method
#defi- nition without needing to enclose the contents in a begin/end block.


#Classes
#Here’s a Ruby class definition:
class Order < ActiveRecord::Base 
	has_many :line_items			#has_many is a method that’s defined by Active Record. (and a declaration)
	
	def self.find_all_unpaid  #class method   ( to_collect = Order.find_all_unpaid)
		self.where('paid = 0')
	end
	
	def total									
	  sum = 0
	  line_items.each {|li| sum += li.total}
	  sum
	end 
end


class Greeter
	def initialize(name)
		@name = name 				#@instanceVariable, write methods that return their values to access outside class
	end
	
	def name 
		@name 							
	end
	
	def name=(new_name)
    @name = new_name
	end 
end
g = Greeter.new("Barney") 
g.name # => Barney 
g.name = "Betty"
g.name # => Betty



class Greeter 
	attr_accessor :name 	# create reader and writer methods
	attr_reader :greeting # create reader only
	attr_writer :age 			# create writer only
end



#A class’s instance methods are public by default; anyone can call them.
#You’ll probably want to override this for methods that are intended to be
#used only by other instance methods:
class MyClass 
	def m1			#public
	end
	
	protected 	#protected
	def m2 
	end 

	private 		#private
	def m3 
	end
end

#The private directive is the strictest; private methods can be called only
#from within the same instance. Protected methods can be called both in the
#same instance and by other instances of the same class and its subclasses.

#Modules
#Unlike classes, you cannot create objects based on modules.
# they act as a namespace
# share functionality between classes

#Multiple classes can mix in the same module, sharing the module’s
#functionality without using inheritance. 
#You can also mix multiple modules into a single class.

#Helper methods are an example of where Rails uses modules. If you wanted to
#write a helper method that would be callable from views invoked by the store
#controller, you could define the following module in the file store_helper.rb
#in the app/helpers directory:
module StoreHelper
	def capitalize_words(string)
		string.split(' ').map {|word| word.capitalize}.join(' ') 
	end
end


#YAML convenient way to define configura- tion of things such as databases,
#test data, and translations.
development:
	adapter: sqlite3
	database: db/development.sqlite3
	pool: 5
	timeout: 5000


=begin
Marshaling Objects

Ruby can take an object and convert it into a stream of bytes that can be
stored outside the application. This process is called marshaling. This saved
object can later be read by another instance of the application

Uses:
Dumping
Def of class and objects it contains

Rails uses marshaling to store session data. If you rely on Rails to
dynamically load classes, it is possible that a particular class may not have
been defined at the point it reconstitutes session data. For that reason,
you’ll use the model declaration in your controller to list all models that
are marshaled. This preemptively loads the necessary classes to make
marshaling work.

=end


class CreateProducts < ActiveRecord::Migration 
	def change	# method that calls method create_table passing the name :products in
		create_table :products do |t|	# pass an object t to accumlate a list of fields
			t.string :title
			t.text :description
			t.string :image_url
			t.decimal :price, precision: 8, scale: 2
      t.timestamps
		end 
	end
end



#Idioms
empty!
empty?
a||b  #The expression a || b evaluates a. If it isn’t false or nil, then evaluation stops, and the expression returns a. Otherwise, the statement returns b
































































































































