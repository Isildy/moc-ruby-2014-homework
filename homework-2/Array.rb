
class NameList

	@@nameList = ["Bobik", "Sharik", "Muhtar", "Evlampiya","Mary Currie","Anatoly Petrovich Shvartsengold"]

	def showList
		@@nameList.map {|x| print "#{@@nameList.index(x)+1} - #{x}\n" }
	end
	
	def addName(name)	
		name.split.each{|x| if x =~/[0-9]/ then return puts "The name can not contain numbers" end } 
		@@nameList << name		
		puts "In the list of added a new name - # {name}. Now in the list of # {@@nameList.size} names"
	end

	def limitTheList (size)
		if @@nameList.length <= size then
			p "List in the normal range"
			showList 
			else
			@@nameList.pop(@@nameList.length-size)
			p "The list is reduced to # {size} names"
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

