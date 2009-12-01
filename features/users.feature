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
		|Password Confirmation|password			|
	When I press "Sign up"
	Then I should be on the home page
	
	Scenario: Logging in as a User
	Given I have a user named "John"
	When I go to the login page
	And I fill in