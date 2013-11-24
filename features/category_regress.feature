Feature: Category Regression Test

  As a blog administrator
  I want to use categories

  Background:
  Given the blog is set up
  And I am logged into the admin panel

  Scenario: Categories are fixed or broken differently
    Given I am on the admin content page
     When I follow "Categories"
     Then I should be on the new page for "Categories"    
     And I should see "General"
     And I should see "Categories"
