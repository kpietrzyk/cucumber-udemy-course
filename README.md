# Udemy Course Finished Project 
### [Mobile Automation: Appium Cucumber for Android&iOS + Jenkins](https://www.udemy.com/course/test-automation-with-appium-cucumber-and-ruby)

- I had to update some code, because it was outdated -> android adb commands or appium code (w3c standard for touch gestures is now used) 

-----

# Appium Cucumber - Mobile testing on Ruby [![Ruby](https://cdn.emojidex.com/emoji/mdpi/Ruby.png "Ruby") ](https://www.ruby-lang.org)

### How to run more then one test using tags

| Command                                      | Description                                                                       |
|----------------------------------------------|-----------------------------------------------------------------------------------|
| `$ cucumber -t @home_screen or @conversions` | ▶ runs test that have both tags in it <br>( @home_screen OR @conversions )        |
| `$ cucumber -t @home_screen -t @conversion`  | ▶ runs test that have both of these tags <br /> ( @home_screen AND @conversions ) |

---

### How to run test from profile

| Command                                     | Description                                                                      |
|---------------------------------------------|----------------------------------------------------------------------------------|
| `$ cucumber -p custom --dry-run`            | ▶ runs profiled tests <br>(`--dry-run` - appium code will run )                  |

---

### How to create reports in cucumber

In `cucumber.yml` we need to add to every profile this lines of code:

```yaml
# Cucumber profiles:
custom: -t @custom_conversions --format html --out report.html --format pretty
```

Where:<br>
`--format html --out report.html` - create report.html file<br>
`--format pretty` - print 'report' into terminal

In terminal:

```shell
$ cucumber -p custom --dryrun
```

Where `custom` - is profile name