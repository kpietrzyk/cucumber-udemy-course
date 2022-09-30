Then('Left Unit picker value should be {string}') do |value|
  sleep 3

  actual_picker_text = find_elements(id: "select_unit_spinner")[0].text
  if actual_picker_text != value
    fail("Expected left unit picker value is #{value}, actual value is #{actual_picker_text}")
  end

end

And(/^Right Unit picker value should be "([^"]*)"$/) do |value|
  sleep 3
  array_of_elements = find_elements(id: "select_unit_spinner")
  actual_picker_text = array_of_elements[1].text
  if actual_picker_text != value
    fail("Expected right unit picker value is #{value}, actual value is #{actual_picker_text}")
  end
end

Then(/^Show all button should be (enabled|disabled|undefined)$/) do |state|
  button_state = find_element(id: "btn_show_all").enabled?
  if state == "enabled"
    fail("Expected to be #{status}, but it is #{button_state}") if button_state != true
  elsif state == "disabled"
    fail("Expected to be #{status}, but it is #{button_state}") if button_state != false
  end
end

When(/^I press on Clear button$/) do
  puts("clear button is pressed")
end

When(/^I type "([^"]*)" on application keyboard$/) do |target|
  digits = target.split("")

  digits.each do |num|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
  end

  # find_element(xpath: "//*[contains(@text, '#{target}')]").click
end

Then(/^I should see result as "([^"]*)"$/) do |result|
  actual_picker_text = find_element(id: "target_value").text

  if actual_picker_text != result
    fail("Expected left unit picker value is #{result}, actual value is #{actual_picker_text}")
  end
end

Then(/^I press on Add to Favorites icon$/) do
  sleep 3
  find_element(id: "action_add_favorites").click
end

Then(/^I press on Favorite conversions$/) do
  sleep 3
  find_element(xpath: "//*[contains(@text, 'Favorite conversions')]").click
end

And(/^I verify "([^"]*)" added to Favorite conversions list$/) do |unit_type|
  sleep 3
  # find_element(xpath: "//*[contains(@text, '"+unit_type+"')]")
  item_text = find_element(id: "favorites_item_hint").text
  if unit_type != item_text
    fail("Expected #{unit_type} , actual value is #{item_text}")
  end
end

Then(/^I press search icon$/) do
  sleep 3
  find_element(id: "action_bar")..find_element(id: "action_search").click
  # find_element(id: "action_search").click
end

Then(/^I type "([^"]*)" in search field$/) do |text|
  sleep 3
  find_element(id: "search_src_text").send_keys(text)
end

And(/^I press return button on soft keyboard$/) do
  sleep 3
  execute_script("mobile: performEditorAction", { "action" => "next" })
  # find_element(id: "search_src_text").perform
end

Then(/^I see "([^"]*)" as a current unit converter$/) do |current_unit|
  sleep 3
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
end

Then(/^I select "([^"]*)" from left unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[0].click
  puts(value)
  find_in_list(value)
end

Then(/^I select "([^"]*)" from menu$/) do |value|
  sleep 3
  find_element(xpath: "//android.widget.TextView[@text='#{value}']").click

end

Then(/^I select "([^"]*)" from right unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[1].click
  puts(value)
  find_in_list(value)
end

When(/^I press on switch units button$/) do
  begin
    find_element(id: "img_switch").click
  rescue
    fail("Element not found!")
  end
end

Then(/^I should see text "([^"]*)"$/) do |text|
  sleep 3
  find_element(xpath: "//android.widget.TextView[@text='#{text}']")
end

And(/^I verify that "([^"]*)" result is history list is a "([^"]*)"$/) do |index, text|
  sleep 3
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  actual_text = array_of_elements[index.to_i - 1].find_element(id: "history_item_hint").text
  if actual_text != text
    fail("Expected test is #{text}, actual text is #{actual_text}")
  end
end

When(/^I press delete from history at "([^"]*)" row$/) do |index|
  sleep 3
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  array_of_elements[index.to_i - 1].find_element(id: "deleteIcon").click
end

