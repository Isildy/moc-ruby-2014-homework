#coding: utf-8

class NameList

	@@nameList = ["Бобик", "Шарик", "Мухтар", "Евлампия", "Мария Кюрри", "Анатолий Петрович Шварценгольд"]

	def showList
		@@nameList.map {|x| print "#{@@nameList.index(x)+1} - #{x}\n" }
	end
	
	def addName(name)	
		name.split.each{|x| if x =~/[0-9]/ then return puts "Имя не может содержать цифры" end } 
		@@nameList << name		
		puts "В список добавленно новое имя - #{name}. Теперь в списке #{@@nameList.size} имен"
	end

	def limitTheList (size)
		if @@nameList.length <= size then
			p "Список в пределах нормы"
			showList 
			else
			@@nameList.pop(@@nameList.length-size)
			p "Список уменьшен до #{size} имен"
			showList
		end
	end	

	def randomList (*size)
		@@nameList.shuffle!
		if size[0] == nil
			showList
			else
			limitTheList(size[0])
		end
	end


	
end

NameList.new.randomList(2)