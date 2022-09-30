@gestures
Feature: User to able to use gestures


  Scenario: User able to swipe to open Left side menu
    Given I land on home screen
    When I swipe left edge to the "right"
    Then I should see left side menu
    Then I swipe left edge to the "left"
    Then I see "Length" as a current unit converter

  @wip
  Scenario: User able to swipe to open calculator
    Given I land on home screen
    When I swipe right edge to "left"
    Then I see "Calculator" as current view
    Then I swipe right edge to "right"
    Then I see "Length" as a current unit converter