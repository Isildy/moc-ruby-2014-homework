
class PhoneBook
	
	@@phoneBook = {"Ivan" => "45-11-23", "Feofan" => "45-23-12", "Anufriy" => "45-28-24", "Abbadon" => "69-22-96"}
	
	def newLine(name, phone_namber)	
		@@phoneBook[name] = phone_namber
		p "Added a new entry in the phone book - #{name} - #{phone_namber}"
	end
	
	def show
	    p "Name       Phone Number"
		@@phoneBook.each {|x,y| print  "#{x}   -  #{y}\n"}
	end 
	
	def find(name)
		p @@phoneBook
		if @@phoneBook.include?(name) == false 
			p "The subscriber is not registered"
		  else
			p "#{name} phone number #{@@phoneBook[name]}"
		end
	end
	
	def delete(line)
		if @@phoneBook.include?(line) == false 
			p "Record not found"
		else
			@@phoneBook.delete_if {|x, y| x==line || y==line}
			p "The record is deleted "					
		end
	end
end
 
