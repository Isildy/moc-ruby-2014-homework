require File.expand_path '../spec_helper.rb', __FILE__


describe "Gladiator" do
  context "validates" do
     before(:each) do
        @glad = FactoryGirl.create :gladiator
     end
      
     it "is valid with valid attributes" do
       @glad.should be_valid
     end
         
     it "is not valid without a name" do
        @glad.name = nil
        @glad.errors_on(:name).should include("can't be blank")  
        @glad.should be_valid
     end
      
     it "is not valid without a age" do
         @glad.age = nil
         @glad.errors_on(:age).should include("can't be blank")
         @glad.should_not be_valid
     end

     it "is not valid without a gender" do
         @glad.age = nil
         @glad.errors_on(:gender).should include("can't be blank")
         @glad.should_not be_valid
     end
      
     it "is not valid if length of name less then 3 characters" do
          @glad.name = "If"
          @glad.should_not be_valid
     end
   end
   context "associations" do
    it "should have many amunition" do
               should have_many(:amunitions)
         end
    end
end


describe "Amunition" do
   context "validates" do 
       before(:each) do
             @amunition = FactoryGirl.create :amunition
        end
    
        it "is valid with valid attributes" do
              @amunition.should be_valid
        end

		    it "is invalid without amunition_type" do
             @amunition.amunition_type = nil
             @amunition.should_not be_valid
        end

        it "is invalid without title" do
             @amunition.title = nil
             @amunition.should_not be_valid
        end
 
        it "is invalid without description" do
             @amunition.description = nil
             @amunition.should_not be_valid
        end
  end


end
  context "associations" do
       it "should belongs_to gladiator" do
          should belong_to(:gladiator)
       end
  end
end