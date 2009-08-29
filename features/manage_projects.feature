Feature: Manage Projects
	In order to make a time tracking system
	As a user
	I want to create and manage projects
	
	Background:
		Given I have a user named John
		When I am logged in as John
		
		Scenario: Projects List
			Given John owns projects Project1, Project2
			And I have a user named Bob
			And Bob owns projects Project3, Project4, Project5, Project6
			And John is a part of projects Project3, Project4
			When I go to the list of projects
			Then I should see "Project1"
			And I should see "Project2"
			And I should see edit and destroy for Project1, Project2
			And I should see "Project3"
			And I should see "Project4"
			And I should not see edit and destroy for Project3, Project4
			And I should not see "Project5"
			And I should not see "Project6"
	
		Scenario: Create Project
			When I create a new project named newProject with John
			Then I should see "newProject"
			And I should see "John"
		
		Scenario: Edit Project with Owner
			Given John owns project Project1
			When I change the name of project "Project1" to "John's Project"
			Then I should be on the project page for "John's Project"
			And I should see "John"
			And I should see "John's Project"
			
		Scenario: Destroy Project with Owner
			Given John owns project Project1
			When I go to destroy the project page for "Project1"
			Then I should be on the list of projects
			And I should not see "Project1"
		
		Scenario: Edit Project with a Project's User but not Owner
			Given I have a user named Bob
			And Bob owns project Project1
			And John is a part of project Project1
			When I go to the edit project page for "Project1"
			Then I should see "You do not own this project"
		
		Scenario: Destroy Project with a Project's User but not Owner
			Given I have a user named Bob
			And Bob owns project Project1
			And John is a part of project Project1
			When I go to destroy the project page for "Project1"
			Then I should see "You do not own this project"
			
		Scenario: Edit Project with a User that is not the Owner and is not a part of the Project
			Given I have a user named Bob
			And Bob owns project Project1
			When I go to the edit project page for "Project1"
			Then I should see "You are not part of this project"

		Scenario: Destroy Project with a User that is not the Owner and is not a part of the Project
			Given I have a user named Bob
			And Bob owns project Project1
			When I go to destroy the project page for "Project1"
			Then I should see "You are not part of this project"