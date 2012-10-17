Feature: Merge Articles
  As a blog administrator
  In order to better organize my blog
  I want to be able to merge 2 articles together

Background:
  Given the blog is set up

  Given I am logged into the admin panel 

  And I create the following articles:
  | title                   | body                  |
  | Who am I?               | My name is Kanu.      |
  | The Terminator          | Action packed movie.  |
  | Chocolate               | Too sweet.            |
  | This is Kanu            | Kanu is here.         |
  | Chicken Run             | Chicken runs slowly.  |
  
  Given the following comments exist: 
    |author | body  | article_id |
    |Jindo  | hey   | 3          |
    |Taburo | hi    | 6          |
    |Ken    | hello | 6          |

  And I am on the edit page of "Who am I?"
  And I fill in "merge_with" with "6"
  And I press "Merge"
  Then I should see "Merge successfully"

Scenario: The merged article's title should be Who am I?
  Then I should see "Who am I?"
  And I should not see "This is Kanu"

Scenario: The merged article should contain the text of both previous articles
  Given I am on the edit page of "Who am I?"
  Then I should see "My name is Kanu"
  And I should see "Kanu is here."

Scenario: The merged article should have one author
  Then the author of "Who am I?" should be "admin"

Scenario: Comments on each of the two original articles need to all carry over and point to the new,   merged article.

  Then "Jindo, Taburo, Ken" should all comment about "Who am I?"





  
  
