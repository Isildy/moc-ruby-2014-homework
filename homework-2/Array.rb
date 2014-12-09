
class NameList

	def showList(nameList)
		nameList.map {|x| print "#{nameList.index(x)+1} - #{x}\n" }
	end
	
	def addName(nameList, name)	
		name.split.each{|x| if x =~/[0-9]/ then return puts "The name can not contain numbers" end } 
		nameList << name		
		puts "In the list of added a new name - #{name}. Now in the list of #{nameList.size} names"
	end

	def limitTheList (nameList, sizeList)
		if nameList.length <= sizeList then
			p "List in the normal range"
			showList(nameList) 
			else
			nameList.pop(nameList.length-sizeList)
			p "The list is reduced to # {sizeList} names"
			showList(nameList)
		end
	end	

	def randomList (nameList,*sizeList)
		nameList.shuffle!
		if sizeList[0] == nil
			showList(nameList)
			else
			limitTheList(nameList, sizeList[0])
		end
	end
end

nList = ["Bobik", "Sharik", "Muhtar", "Evlampiya","Mary Currie","Anatoly Petrovich Shvartsengold"]

nl = NameList.new
nl.showList(nList)
p "=============================================="
p "Add Lilia to list"
nl.addName(nList, "Lilia")
p "=============================================="
p "list limited to 8"
nl.limitTheList(nList, 8)
p "=============================================="
p "list limited to 5"
nl.limitTheList(nList, 5)
p "=============================================="
p "Random list"
nl.randomList(nList)
p "=============================================="
p "Random list limited to 3"
nl.randomList(nList, 3)