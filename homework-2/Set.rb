
class SantaGiftList
 
  	require 'set'

  	def showList (kList)
  		p "This year, the gift will receive #{kList.size} children"
  		kList.map {|x| print "#{x}\n"}
  	end

  	def addName (kList, name)
		  if kList.add?(name)  == nil
			 p "#{name} is already listed. The provisions give only one presented in hands"
			 else
			 p "The list of children added #{name}. Now the list of #{kList.size} children"
		  end
  	end

  	def  giveGift (kList, name)
        if kList.include?(name) == true
            p "#{name} will receive a wonderful gift for the new year"
          else
            p "#{name} behaved badly throughout the year, this will not receive gifts"
       end
    end
end
kidsList = Set.new(["Masha","Sasha","Piter","Lena","Vasia","Vova"])

kl = SantaGiftList.new
kl.showList(kidsList)
p "=============================================="
p "Mash in a list?"
kl.addName(kidsList, "Masha")
p "=============================================="
p "Add Maksimka lo list"
kl.addName(kidsList, "Maksimka")
p "=============================================="
p "Give a gift Vasia?"
kl.giveGift(kidsList, "Vasia")
p "=============================================="
p "Give a gift Sergei?"
kl.giveGift(kidsList, "Serioga")


