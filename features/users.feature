Feature: Users
	In order to manage users
	As an user
	I want to create, edit, and view users
	
	Scenario: Creating a User
	Given I go to the new user page
	When I fill in the following:
		|Login								|John					|
		|Email								|john@test.com|
		|Name									|John Doe			|
		|Password							|password			|
		|Password confirmation|password			|
	When I press "Create"
	Then I should be on "John"'s user page
	And I should see "John"
	And I should see "john@test.com"
	And I should see "John Doe"
	
	Scenario: Logging in as a User
	Given I have a user named "John"
	When I go to the login page
	And I fill in