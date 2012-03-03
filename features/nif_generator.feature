Feature: NifGenerator
  In order to start validating nifs
  As a user of the NifGenerator
  I want a NifGenerator to start validating
  
  Scenario: NifGenerator validates a nif
    Given a NifGenerator
    When I validate a valid nif
    Then I should see "true"
