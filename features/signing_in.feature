Feature: Signing in

  Scenario: Unsuccessful signin
    Given a user visits the signin page
    When they submit invalid signin information
    Then they should see an error message

  Scenario: Successful signin
    Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
    Then they should see their profile page
	Then they should have link Settings
      And they should see a signout link
	  
	Scenario: User visits edit pages
     Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
	    Then user click link Settings
        Then user should have content "Update your profile"	  
	    Then user should have title "Edit user"
		And user should have link gravatar
		
    Scenario: User with invalid information to edit page
	  Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
	    Then user click link Settings
		Then user click Save_changes
	    And should have content error
		
	Scenario: Update controller
	   Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
	    Then user click link Settings
		 Then user should have title "Edit user"
		 When the user submits valid update information
		 Then user should have title  new name
		 Then user should have selector alert-saccess
		 Then user reload name to eq new name
		 And user reload email to eq email
		 
	Scenario: Authorization for non-signed-in users
	    Given FactoryGirl
		Then visit the edit page
		And user should have title "Sign in"
		Then see update controller for non signed
		And see response update 
		