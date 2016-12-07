Feature: Manage Category
  As an admin
  I want to manage category

  Background: 
    Given the blog is set up
    When I am logged into the admin panel

  Scenario: Create new Category
    Given I am on new category page
    When I fill in "category_name" with "Food"
    When I fill in "category_keywords" with "Cookies"
    When I fill in "category_permalink" with "food"
    When I fill in "category_description" with "things we eat"
    And I press "Save"
    Then I should be on new category page
    And I should see "Category was successfully saved."
    And I should see "Food"
