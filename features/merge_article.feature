Feature: Merge Articles
  As a blog administrator
  In order to fix duplicate content
  
  Background:
    Given the blog is set up
    
    And the following articles exist:
    | id  | type      | title | body               | published | state     | allow_comments  |
    |  2  | article   | Foo   | "Lorem Ispsum foo" | t         | published | t               |
    |  3  | article   | Bar   | "Lorem Ispsum bar" | t         | published | t               |
    |  4  | article   | Ted   | "Lorem Ispsum ted" | t         | published | t               |
    
    And the following comments exist:
    | id | article_id   |  body               | title         | author   |
    | 1  | 4            | "it's a body here"  | "commie talk" | TinyTina |
    
    And I am logged into the admin panel

  Scenario: Merge should be available to admin
    Given I am on the admin content page
    When I follow "Foo" 
    Then I should be on the view page for "Foo" # Actually edit page
    And I should see "Lorem Ispsum foo"
    And I should see "Merge Articles"
    
  Scenario: Merge should not be available on new page
    When I am on the new article page
    Then I should not see "Merge"  
    
  Scenario: Merge should transfer new article and comments to old
    When I am on the view page for "Foo"
    When I fill in "Article ID" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    Then I should see "Foo"
    And I should not see "Bar"
    And all the comments should be on that one too
    #could use page.body.all('tbody tr').count somehow
  
  Scenario: Merge should delete old Article
    
