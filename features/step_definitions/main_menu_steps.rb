Given('I land on home screen') do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When(/^I press on menu icon$/) do
  find_element(accessibility_id: "Open navigation drawer").click
end

Then(/^I should see left side menu$/) do
  sleep 3
  find_element(xpath: "//*[contains(@text, 'Unit Converter')]")
end

And(/^I press on My conversions button$/) do
  find_element(xpath: "//*[contains(@text, 'My conversions')]").click
end

Then(/^I land on My conversions screen$/) do
  find_element(xpath: "//*[contains(@text, 'No personal conversion created yet')]")
end