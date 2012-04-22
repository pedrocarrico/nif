Feature: NifGenerator
  In order to start validating nifs
  As a user of the NifGenerator
  I want a NifGenerator to start validating

  Scenario: NifGenerator validates a valid nif
    Given a NifGenerator
    When I validate a nif like "502874210"
    Then I should see "true"

  Scenario: NifGenerator validates an invalid nif
    Given a NifGenerator
    When I validate a nif like "502874211"
    Then I should see "false"

  Scenario: NifGenerator generates a valid nif
    Given a NifGenerator
    When I generate a valid nif
    Then I should see "true"
