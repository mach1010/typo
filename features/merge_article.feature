Feature: Write Articles
  As a blog administrator
  In order to fix duplicate content

  Background:
  Given the blog is set up

  And the following articles exist:
  | id | title | body            | state     | allow_comments |
  |  2 | Foo   | FFFFFF Foo body | published | t              |
  |  3 | Bar   | BBBBBB Bar body | published | t              |
  |  4 | Ted   | TTTTTT Ted body | published | t              |
  
  And the following comments exist:
  | id | article_id | body     | title        | author   |
  |  2 | 3          | body one | commie talk  | TinyTina |
  |  3 | 4          | body two | weather chat | TinyTuna |
  
  And I am logged into the admin panel
  And I am on the admin content page 

  Scenario: Merge should be available to admin
    Given I am on the admin content page
     When I follow "Foo"
     Then I should be on the view page for "Foo"
      And I should see "FFFFFF Foo body"
      And I should see "Merge Articles"
    
  Scenario: Merge should not be available on New page
    Given I am on the new article page
     Then I should not see "Merge"

  Scenario: Merge should copy old Article and comments to current Article
    Given I am on the view page for "Ted"
     When I fill in "Article ID" with "3"
      And I press "Merge"
     Then I should be on the admin content page
      And I should see "Foo"
      And I should see "Bar"
      And I should not see "Ted"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am on the home page
     Then I should see "Bar"
      And I should see "BBBBBB Bar body"
      And I should see "TTTTTT Ted body"

  Scenario: A non-admin cannot merge two articles
    Given I am on the admin content page
     When I follow "Log out »"
     Then I should see "Successfully logged out"
      And I should not see "Bar"
