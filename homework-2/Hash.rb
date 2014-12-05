#coding: utf-8

class PhoneBook
	
	@@phoneBook = {"Иван" => "45-11-23", "Феофан" => "45-23-12", "Ануфрий" => "45-28-24", "Аббадон" => "69-22-96"}
	
	def newLine(name, phone_namber)	
		@@phoneBook[name] = phone_namber
		p "Добавлена новая запись в телефонную книгу - #{name} - #{phone_namber}"
	end
	
	def show
	    p "Имя       Номер"
		@@phoneBook.each {|x,y| print  "#{x}   -  #{y}\n"}
	end 
	
	def find(name)
		p @@phoneBook
		if @@phoneBook.include?(name) == false 
			p "Абонент не зарегестрирован"
		  else
			p "Номер абонента #{name}- #{@@phoneBook[name]}"
		end
	end
	
	def delete(line)
		if @@phoneBook.include?(line) == false 
			p "Запись не найдена"
		else
			@@phoneBook.delete_if {|x, y| x==line || y==line}
			p "Запись удалена "					
		end
	end
end
 
