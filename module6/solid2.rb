# [L]iskov Substituion Principle 
class Bird
  def sound
    raise NotImplementedError
  end
  def fly
    # "I will fly!"
    raise NotImplementedError
  end
end

# subtype == atttributes

class Duck < Bird
  def sound
    "quack"
  end

  def fly
    "I will fly"
  end
end

class Ostrich < Bird
  def sound
    "bark"
  end
  def fly
    # raise "I can't fly"
    "I can't fly"
  end
end

sam_bird = Duck.new
osma_bird = Ostrich.new

# puts sam_bird.fly
# puts osma_bird.fly

################################

# [D] high level (notification generator) should not depend on low level

# this one is called 'IMPORTING'
# def copy(input)
#   reader = KeyboardReader.new
#   writer = Printer.new

#   reader.read(input)
#   writer.write(input, reader.name)
# end

class Copier
  # while this one is called 'INJECTION'
	def copy(input, reader, writer) 
		reader.read(input)
		writer.write(input, reader.name)
	end
end

class MainPrinter
end

class Printer
	def write(input, reader_name)
		"printer prints '#{input}' from #{reader_name}"
	end
end

class PrintReader
	def write(input, reader_name)
		"printer_reader prints '#{input}' from #{reader_name}"
	end
end

class MainReader
end

class KeyboardReader
	def name
		"keyboard"
	end
	def read(input)
		"keyboard read #{input}"
	end
end

class Scanner
	def name
		"scanner"
	end
	def read(input)
		"scanner read #{input}"
	end
end

my_printer = Copier.new
my_reader = Scanner.new
my_writer = PrintReader.new
my_new_writer = Printer.new

puts my_printer.copy("Halo", my_reader, my_writer)
puts my_printer.copy("Hola", my_reader, my_new_writer)
