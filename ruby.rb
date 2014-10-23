###########
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

	a = [ 1, 'cat', 3.14 ] a[0]
	a[2] = nil
	# array with three elements
	# access the first element (1)
	# set the third element
	# array now [ 1, 'cat', nil ]


ages = []
for person in @people
  ages << person.age
end