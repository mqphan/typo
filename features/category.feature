Feature: article has category

  As a administrator
  So that I can categorize and better organize the articles
  I want article to have a category

Background: 
  Given the blog is set up

  Given the following categories exist:
  | name | 
  | huhu |
  | hehe |

  Given I am logged into the admin panel

Scenario: admin can see a list of categories
  Given I follow "Categories"
  Then I should see "huhu"
  And I should see "hehe"

Scenario: admin can create new category
  When I follow "Categories"
  And I fill in "category_name" with "haha"
  And I press "Save"
  Then I should see "haha"

Scenario: admin can edit a category
  Given I am on the edit page of "huhu" category
  And I fill in "category_name" with "hihi"
  And I press "Save"
  Then I should see "hihi"

Scenario: name of category must not be blank
  Given I am on the edit page of "huhu" category
  And I fill in "category_name" with ""
  And I press "Save"
  Then I should see "Category could not be saved."

Scenario: name of category must be unique
  Given I am on the create category page
  And I fill in "category_name" with "hehe"
  And I press "Save"
  Then I should see "Category could not be saved."
  
