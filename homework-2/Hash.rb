

class PhoneBook
	
	def newLine(phone_book ,name, phone_namber)	
		phone_book[name] = phone_namber
		p "Added a new entry in the phone book - #{name} - #{phone_namber}"
		show(phone_book)
	end
	
	def show (phone_book)
	    p "Name       Phone Number"
		phone_book.each {|x,y| print  "#{x}   -  #{y}\n"}
	end 
	
	def find(phone_book ,name)
		phone_book
		if phone_book.include?(name) == false 
			p "The subscriber is not registered"
		  else
			p "#{name} phone number #{phone_book[name]}"
		end
	end
	
	def delete(phone_book, line)
		if phone_book.include?(line) == false 
			p "Record not found"
		else
			phone_book.delete_if {|x, y| x==line || y==line}
			p "The record is deleted "	
			show(phone_book)			
		end
	end
end
 
pBook = {"Ivan" => "45-11-23", "Feofan" => "45-23-12", "Anufriy" => "45-28-24", "Abbadon" => "69-22-96"}

pb = PhoneBook.new
pb.show(pBook)
p "=============================================="
p "Try add qwerty11 to list"
pb.newLine(pBook ,"qwerty11", "45-13-34")
p "=============================================="
p "Try add Lena to list"
pb.newLine(pBook ,"Lena", "45-13-34")
p "=============================================="
p "Try to find Feofan in the list"
pb.find(pBook ,"Feofan")
p "=============================================="
p "Try to remove Jenia from list"
pb.delete(pBook ,"Jenia")
p "=============================================="
p "Try to remove Feofan from list"
pb.delete(pBook ,"Feofan")