Feature: Create Category
  As a blog administrator
  I want to create a category
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Create new Category
    Given I am on new category page
    When I fill in "category_name" with "Food"
    When I fill in "category_keywords" with "Cookies, Chips"
    When I fill in "category_permalink" with "food"
    When I fill in "category_description" with "Things we eat"
    And I press "Save"
    Then I should be on new category page
    And I should see "Category was successfully saved"
    And I should see "Food"