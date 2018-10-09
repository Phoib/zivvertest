Feature:
    In order to check the reading of a predefined message, with access code
    As a developer 
    I want to make sure that a guest user can still read messages

Background:
    Given I open the url "/l/open/90a47332-ae3a-4afe-9688-45e3288e4625/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqc29uQ2xhc3MiOiJaaXZ2ZXJTaGFyZVRva2VuIiwiZW1haWxBZGRyZXNzIjoiZW1pZWwuc3VpbGVuK3Rlc3QzQGdtYWlsLmNvbSIsInNoYXJlVXVpZCI6ImQwOTQ4YmRkLTcyNzgtNGE4NC1hNjMwLTU4ZjcyYWZkN2E1MSIsImFjY291bnRLZXlVdWlkIjoiOWYxNTJhYjItNWI5Yi00MjdmLTk1NDctM2RmZmYzMTQzZTA4IiwicGFzc0tleSI6IkpLNUxKRWpKclpMTkg3RzhDTmkrZGc9PSJ9.p9TpUd7YzCOWxNw2bfrWsLFrt1T9R7jbSCNOrdL8xwk"

Scenario: Open the page and check the layout
    Then I expect that the title is "ZIVVER"
    And I wait on element "body > div > div > main > div > h2" for 2000ms to exist
    And I expect that element "body > div > div > main > div > h2" matches the text "Unlock message"
    And I expect that element "body > div > div > main > div > conversation-challenge > form > div > div.layout-row.flex-100 > md-input-container > label > translate" matches the text "Access code"
    And I expect that element "body > div > div > main > div > conversation-challenge > form > div > div.md-actions.layout-align-space-between-stretch.layout-column.flex-100 > button > translate" matches the text "UNLOCK"
    And I expect that element "body > div > div > main > div > conversation-challenge > form > div > div.md-actions.layout-align-space-between-stretch.layout-column.flex-100 > button" is not enabled

Scenario: Try to access with an invalid access code
    Then I expect that element "#zivver-main > div > div > div > div > div > div > md-card > md-card-content > conversation-challenge > form > div > div.layout-row.flex-100 > md-input-container > div.md-input-messages-animation.md-auto-hide.ng-active > div > translate" is not visible
    And I wait on element "#response" for 2000ms to exist
    When I set "abc" to the inputfield "#response"
    And I pause for 500ms
    Then I expect that element "#zivver-main > div > div > div > div > div > div > md-card > md-card-content > conversation-challenge > form > div > div.md-actions.layout-align-space-between-stretch.layout-column.flex-100 > button" is enabled
    When I click on the element "#zivver-main > div > div > div > div > div > div > md-card > md-card-content > conversation-challenge > form > div > div.md-actions.layout-align-space-between-stretch.layout-column.flex-100 > button" 
    And I pause for 500ms
    Then I expect that element "#zivver-main > div > div > div > div > div > div > md-card > md-card-content > conversation-challenge > form > div > div.layout-row.flex-100 > md-input-container > div.md-input-messages-animation.md-auto-hide.ng-active > div > translate" is visible
    And I expect that element "#zivver-main > div > div > div > div > div > div > md-card > md-card-content > conversation-challenge > form > div > div.layout-row.flex-100 > md-input-container > div.md-input-messages-animation.md-auto-hide.ng-active > div > translate" matches the text "Incorrect access code"
    And I expect that element "#zivver-main > div > div > div > div > div > div > md-card > md-card-content > conversation-challenge > form > div > div.md-actions.layout-align-space-between-stretch.layout-column.flex-100 > button" is not enabled

Scenario: I try to acces the message with correct access code
    Then I wait on element "#response" for 2000ms to exist
    When I set "123" to the inputfield "#response"
    And I pause for 500ms
    Then I expect that element "#zivver-main > div > div > div > div > div > div > md-card > md-card-content > conversation-challenge > form > div > div.md-actions.layout-align-space-between-stretch.layout-column.flex-100 > button" is enabled
    When I click on the element "#zivver-main > div > div > div > div > div > div > md-card > md-card-content > conversation-challenge > form > div > div.md-actions.layout-align-space-between-stretch.layout-column.flex-100 > button" 
    And I wait on element "#zivver-main > div > div > div > div > div > conversation-header > div > aside.header.middle.layout-padding.layout-align-space-between-center.layout-row > div.title.flex > span" for 2000ms to exist
    And I pause for 500ms
    Then I expect that element "#zivver-main > div > div > div > div > div > conversation-header > div > aside.header.middle.layout-padding.layout-align-space-between-center.layout-row > div.title.flex > span" matches the text "Emiel Suilen <emiel.suilen@gmail.com>"

