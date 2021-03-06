require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { "Create my account" }
	
	describe "With invalid infotmation" do
	  it "should not create a user" do
	    expect {click_button submit}.not_to change(User, :count)
		end
		end
		
    describe "with valid information" do
	  before do
	  fill_in "Name",        with: "Example User"
	  fill_in "email",       with: "user@example.com"
      fill_in "password",    with: "foobar"
      fill_in "Confirmation", with: "foobar"
      end
      
      it "should create a user" do
          expect {click_button submit}.to change(User, :count).by(1)
	 end 
	 end
	 end
	 end