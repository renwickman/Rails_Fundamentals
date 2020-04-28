require 'rails_helper'
RSpec.describe User do

  context "With valid attributes" do 
    it "should save" do 
      user = User.new(
        first_name: 'Anthony',
        last_name: 'Renwick',
        email: 'arenwick@codingdojo.com'
      )
      expect(user).to be_valid
    end
  end

  context "With invalid attributes" do  
    it "should not save if first_name field is blank" do
      user = User.new(
            first_name: '', 
            last_name: 'Renwick', 
            email: 'arenwick@codingdojo.com'
        )
      expect(user).to be_invalid
    end
    
    it "should not save if last_name field is blank" do
      user = User.new(
              first_name: 'Anthony', 
              last_name: '', 
              email: 'arenwick@codingdojo.com'
          )
        expect(user).to be_invalid
    end
    
    it "should not save if email already exists" do
      user = User.create(
        first_name: "Anthony",
        last_name: "Renwick",
        email: "arenwick@codingdojo.com"
      )
      user2 = User.new(
        first_name: "Other",
        last_name: "Name",
        email: "arenwick@codingdojo.com"
      )
      expect(user2).to be_invalid
    end
    
    it "should not save if invalid email format" do
      user = User.new(
                first_name: 'Anthony', 
                last_name: 'Renwick', 
                email: 'arenwick@codingdojo'
            )
        expect(user).to be_invalid
    end
  end

end