
class SantaGiftList
 
  	require 'set'

 	@@kidList = Set.new(["Masha","Sasha","Piter","Lena","Vasia","Vova"])

  	def showList
  		p "This year, the gift will receive #{@@kidList.size} children"
  		@@kidList.map {|x| print "#{x}\n"}
  	end

  	def addName (name)
		  if @@kidList.add?(name)  == nil
			 p "#{name} is already listed. The provisions give only one presented in hands"
			 else
			 p "The list of children added #{name}. Now the list of #{@@kidList.size} children"
		  end
  	end

  	def  giveGift (name)
        if @@kidList.include?(name) == true
            p "#{name} will receive a wonderful gift for the new year"
          else
            p "#{name} behaved badly throughout the year, this will not receive gifts"
    end
end

