Feature: Merge Articles
  As a blog administrator
  In order to better organize my blog
  I want to be able to merge 2 articles together

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And I create the following articles:
  | title                   | body                  |
  | Who am I?               | My name is Kanu.      |
  | The Terminator          | Action packed movie.  |
  | Chocolate               | Too sweet.            |
  | This is Kanu            | Kanu is here.         |
  | Chicken Run             | Chicken runs slowly.  |
  And I am logged out

Scenario: Regular blogger does not see merge option
  Given the regular blogger "222" account is set up
  And I am logged into the regular blogger "222" panel
  And I create the following articles:
  | title      | body           |
  | Second     | second article |
  And I am on the edit page of "Second"
  Then I should not see "Merge Articles"

Scenario: Can not merge the same article
  Given I am logged into the admin panel
  And I am on the edit page of "Who am I?"
  And I should see "Merge Articles"
  And I fill in "merge_with" with "3"
  And I press "Merge"
  Then I should see "Merge unsuccessfully. Can not merge the same article."

Scenario: Can not merge unexisted article
  Given I am logged into the admin panel
  And I am on the edit page of "Who am I?"
  And I fill in "merge_with" with "60"
  And I press "Merge"
  Then I should see "Merge unsuccessfully. Article does not exist."
  

