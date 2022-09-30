@home_screen
Feature: Tests for Home screen functionality

  Background:
    Given I land on home screen

  @default
  Scenario: Default values on Home screen is Foot and Centimeter
    Then Left Unit picker value should be "Foot"
    And Right Unit picker value should be "Centimeter"


  Scenario: Show all button should be enabled at launch
    Then Show all button should be disabled
    When I type "1" on application keyboard
    Then Show all button should be disabled
#    Then Show all button should be undefined

  @conversions
  Scenario Outline: Verify default conversion
    When I type "<target>" on application keyboard
    Then I should see result as "<result>"
    Examples:
      | target | result    |
      | 1      | 30.48     |
      | 2      | 60.96     |
      | 3      | 91.44     |
      | 9      | 274.32    |
      | 10     | 304.8     |
      | 1011   | 30 815.28 |

  @custom_conversions
  Scenario: User able to add current conversion to Favorites list
    Then I press on Add to Favorites icon
    When I press on menu icon
    Then I press on Favorite conversions
    And I verify "Length" added to Favorite conversions list


  Scenario: User able to search by existing Conversion type
    Then I press search icon
    Then I type "Temperature" in search field
    And I press return button on soft keyboard
    Then I see "Temperature" as a current unit converter
    Then Left Unit picker value should be "Celsius"
    Then Right Unit picker value should be "Fahrenheit"


  Scenario Outline: User able to select values from unit pickers
    Then I select "<unit_type>" from left unit picker
    When I type "<amount>" on application keyboard
    Then I should see result as "<result>"

    Examples:
      | unit_type        | amount | result |
#    | Inch    | 1      | 2.54   |
#    | Link    | 1      | 20.1168|
      | Meter1           | 1      | 100    |
      | [Hist.rus.] Span | 1      | 17.78  |


  Scenario: User able to convert values
    When I press on menu icon
    Then I select "Volume" from menu
    Then I select "Cup" from right unit picker
    When I type "1" on application keyboard
    Then I should see result as "15.1416"


  Scenario: User able to switch values
    Then Left Unit picker value should be "Foot"
    And Right Unit picker value should be "Centimeter"
    When I press on switch units button
    Then Left Unit picker value should be "Centimeter"
    And Right Unit picker value should be "Foot"


  Scenario: User able to cleanup conversion history
    When I press on menu icon
    Then I select "History" from menu
    Then I see "History" as a current unit converter
    Then I should see text "No history right now"
    When I press on menu icon
    Then I select "Length" from menu
    Then I type "1" on application keyboard
    Then I press on menu icon
    Then I select "History" from menu
    And I verify that "1" result is history list is a "Length"
    When I press delete from history at "1" row
    Then I should see text "No history right now"
