# When(/^I swipe from left to right$/) do
#   sleep 3
#   # execute_script("mobile: performEditorAction", { "action" => "next" })
#
#
# end

When(/^I swipe right edge to "([^"]*)"$/) do |text|
  sleep 3
  swipe_right_edge_to(text)
  # positive +x axis starts from top left corner of device screen (from left to right values increases)
  # positive +y axis starts from top left corner of device (from from up to down values increases)
  # left -(value in pixels) x coordinate of upper left corner of 'swipe bounding area'
  # top - (value in pixels) y coordinate of upper lef corner of 'swipe bounding area'
  # width - (value in pixels) how wide is swipe
  # height -(value in pixels) how 'big' is swiping 'finger'
  #                        end of swipe (up)
  # point(left, top).------.-------.
  #        |        |      ^       |
  # height |        |      ^       |
  #        |        |      ^       |
  #        |        |      ^       |
  #                 |..............|width

  # execute_script("mobile: swipeGesture", {"left" => 500, "top" => 500, "width" => 200, "height" => 200,
  #                                         "direction" => "left", "percent"  => 0.75, "speed" => 2000})
end

#When(/^I swipe from left to right$/) do
#   Appium::TouchAction.new.swipe(start_x: 0.01, start_y: 0.5, end_x: 0.8, end_y: 0.5, duration:600).perform
# end
#
# Then(/^I swipe from right to left$/) do
#   Appium::TouchAction.new.swipe(start_x: 0.99 , start_y: 0.5, end_x: 0.01, end_y: 0.5, duration:600).perform
# end

Then(/^I see "([^"]*)" as current view$/) do |view|
  sleep 5
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{view}']")
end

When(/^I swipe left edge to the "([^"]*)"$/) do |text|
  sleep 3
  swipe_left_edge_to(text)
end