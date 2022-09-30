require 'cucumber'

Before do
  $driver.start_driver
  sleep 3
end

After do |scenario|
  if scenario.failed?
    unless File.directory?("screenshots")
      FileUtils.mkdir_p("screenshots")
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = time_stamp + ".png"
    screenshot_file = File.join("screenshots", screenshot_name)
    $driver.screenshot(screenshot_file)

    attach(screenshot_file, 'image/png')
  end
  $driver.driver_quit
end

BeforeAll do
  (FileUtils.rm_r "screenshots", :force => true) if File.directory?("screenshots")
end



