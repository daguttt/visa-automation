require 'selenium-webdriver'
require 'dotenv/load'

AUTH_EMAIL = ENV.fetch("AUTH_EMAIL")
AUTH_PASSWORD = ENV.fetch("AUTH_PASSWORD")
AUTH_PAGE_URL = 'https://ais.usvisa-info.com/en-co/niv/users/sign_in'

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 500

def interact_with_auth_page(driver:)
  driver.get(AUTH_PAGE_URL)
  driver.find_element(name: "user[email]").send_keys(AUTH_EMAIL)
  driver.find_element(name: "user[password]").send_keys(AUTH_PASSWORD)
  # Click the `policy_confirmed` input checkbox's parent element. This avoids ElementClickInterceptedError
  driver.find_element(class: "icheckbox").click
  driver.find_element(name: "commit").click
  sleep 3600 # TODO: Delete this
end

interact_with_auth_page(driver: driver)

driver.quit



