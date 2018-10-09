# zivvertest
Three small Gherkin scenarios to test the guest user acapablities for Zivver.

# Additional findings
Reopening the page changes the complete layout by replacing the #main body by the #zivver-main body. This makes tests extremely fragile, as the first scenario must take that into account. This also places a hard dependency on the order of the tests, which should never happen. Tests should be independant of each other.
Most elements do not have nice ID's. That makes UI-testing a lot easier to do. Nobody wants a huge _#zivver-main > div > div > div > div > div > conversation-header > div > aside.header.middle.layout-padding.layout-align-space-between-center.layout-row > div.title.flex > span_ selector. They'd want a #participants.
