require 'appium_lib'
require 'rspec'
require 'pry'

def caps
  { caps: {
    deviceName: "emulator-5554",
    udid: "emulator-5554",
    platformName: "Android",
    app: (File.join(File.dirname(__FILE__), "PreciseUnitConversion.apk")),
    appPackage: "com.ba.universalconverter",
    appActivity: "MainConverterActivity",
    newCommandTimeout: "3600"
  }
  }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def find_in_list(value)
  begin
    find_element :uiautomator, "new UiScrollable(new UiSelector().scrollable(true))" +
      ".scrollIntoView(new UiSelector().text(\"#{value}\"))"
    el = find_element(xpath: "//android.widget.TextView[@text='#{value}']")
    el.click
  rescue Exception => e
    fail("Cannot find element with text #{value}")
  end
  sleep 3

  #  DEPRECATION !  use w3c standard
  # 3.times { Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.2, end_x: 0.5, end_y: 0.8, duration:600).perform }
  #
  # current_screen = get_source
  # previous_screen = ""
  #
  # until (exists{ text(value) }) || (current_screen == previous_screen) do
  #   Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.2, duration:600).perform
  #   previous_screen = current_screen
  #   current_screen = get_source
  # end
  #
  # if exists{ text(value) }
  #   text(value).click
  # else
  #   fail("Cannot find element with text #{value}")
  # end

end

def swipe_right_edge_to(text)
  binding.pry
  resolution = @driver.window_size
  resolution_with = resolution.width
  resolution_height = resolution.height
  x = resolution_with / 2
  y = resolution_height / 2
  w = resolution_with * 0.49
  h = 1
  execute_script("mobile: swipeGesture", { "left" => x, "top" => y, "width" => w, "height" => h,
                                           "direction" => text, "percent" => 0.75, "speed" => 2000 })
end

def swipe_left_edge_to(text)
  resolution = @driver.window_size
  resolution_with = resolution.width
  resolution_height = resolution.height
  x = 1
  y = resolution_height / 2
  w = resolution_with * 0.49
  h = 1
  execute_script("mobile: swipeGesture", { "left" => x, "top" => y, "width" => w, "height" => h,
                                           "direction" => text, "percent" => 0.75, "speed" => 2000 })
end
