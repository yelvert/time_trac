Feature: Manage Projects
	In order to make a projects list
	As a user
	I want to create and manage projects

	Scenario: Projects List
		Given I have a user named John
		And John owns projects Project1, Project2
		And John is a part of projects Project3, Project4
		And John does not own and is not a part of projects Project5, Project6
		When I am logged in as John with password testing
		And I go to the list of projects
		Then I should see "Project1"
		And I should see "Project2"
		And I should see edit and destroy for Project1, Project2
		And I should see "Project3"
		And I should see "Project4"
		And I should not see edit and destroy for Project3, Project4
		And I should not see "Project5"
		And I should not see "Project6"
