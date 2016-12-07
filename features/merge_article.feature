Feature: Merge Articles
    As a blog administrator
    In order to avoid multiple similar articles
    I want to be able to merge two articles

    Background:
        Given the blog is set up
        Given the following users exist
            | profile_id | login  | name  | password | email         |
            | 1          | user1  | user1 | password | one@gmail.com |
            | 2          | user2  | user2 | password | two@gmail.com |
 
        And the following articles exist
            | id | title  | body  | author | user_id | allow_comments | state     | type    |
            | 3  | title1 | body1 | user1  | 1       | true           | published | Article |
            | 4  | title2 | body2 | user2  | 2       | true           | published | Article |

        And the following comments exist
            | id | author | body     | article_id | type    |
            | 1  | user1 | comment1  | 3          | Comment |
            | 2  | user1 | comment2  | 4          | Comment |
        
        Given I am logged into the admin panel
        And I am on the Edit Page of Article with id 3
        Then I should see "Merge Articles"
        When I fill in "merge_with" with "4"
        And I press "Merge With This Article"
        Then I should be on the admin content page
        And I should see "Articles merged successfully"

    Scenario: A non-admin cannot merge articles
        Given I follow "Log out"
        And I am logged in as "user1" with password "password"
        And I am on the Edit Page of Article with id 3
        Then I should not see "Merge With This Article"

    Scenario: The merged articles should contain the text of both previous articles
        Given I am on the home page
        Then I should see "title1"
        When I follow "title1"
        Then I should see "body1"
        And I should see "body2"

    Scenario: The merged article should have one author
        Then "user1" should be author of "title1"

    Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
        Given I am on the home page
        Then I should see "title1"
        When I follow "title1"
        Then I should see "comment1"
        And I should see "comment2"

    Scenario: The title of the new article should be the title from either one of the merged articles
        Given I am on the home page
        Then I should see "title1"
        And I should not see "title2"