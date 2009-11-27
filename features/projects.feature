Feature: Projects
  In order to manage projects
	As a User
	I want to create, edit, and view projects
	
	
	Background:
	Given I have a user named John
	And John is logged in
	
	Scenario: Creating a Project
	When I am on the create project page
	And I fill in "Name" with "Cucumber Project"
	And I press "Submit"
	Then I should be on the show project page for "Project" named "Cucumber Project"
	And I should see "John"
	And I should see "Cucumber Project"