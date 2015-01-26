require File.expand_path '../spec_helper.rb', __FILE__

describe "/" do

	it "should allow accessing the default route" do
		get '/'
		expect(last_response).to be_ok
	end
	
	it "respond method '.greeting'" do  	
		get '/'
		expect(last_response.body).to match('Going to death')
 end

		it "should have the link to 'Gladiator info'" do
			click_link('Gladiator info')
		end
		it "should have the link to 'Lets fight!'" do
			click_link('Lets fight!')
		end

end


describe "/glad_info" do

	it "should allow accessing the default route" do
		get '/glad_info'
		expect(last_response).to be_ok
	end
	
	it "respond method '.age'" do  	
		get '/glad_info'
		expect(last_response.body).to match('His age')
 end

it "respond method '.spearman?'" do  	
		get '/glad_info'
		expect(last_response.body).to match('Our gladiadiator spearman!')
 end
it "respond method '.have_weapon?'" do  	
		get '/glad_info'
		expect(last_response.body).to match('is carrying')
 end


		it "should have the link to 'Back to area'" do
			click_link('Back to area')
		end
end