Feature: Category Regression Test
  As a blog administrator
  I want to use categories

  Background:
  Given the blog is set up
  And I am logged into the admin panel

  # Breaks: DB empty, params not making, controller method not handling missing
  # Look at content_controller#new_or_edit for comparison
  # may detect changes in error messages here as changes made
  Scenario: Categories are still broken the way they were
    Given I am on the home page
     When I enter a uri for the edit page for "Category" with id "1"
     Then I should see "General"        
      And I should not see "ActiveRecord::RecordNotFound"

    Given I am on the admin content page
     When I go to the new categories page
     Then I should be on the new categories page
     And  I should see "Permalink" 
      
      
      
      
      
    #Given I am on the home page
     #When I enter a uri for the edit page for "Category" with no id
     #Then I should see "ActiveRecord::RecordNotFound"
     # And I should see "Couldn't find Category without an ID"
      
    #Given I am on the admin content page
     #When I try to follow the index route for Categories
     #Then I see something
