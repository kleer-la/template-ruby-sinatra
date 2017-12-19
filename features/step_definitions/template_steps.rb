Given /^I open the web app$/ do
  visit '/'
end

Given /^I post to the web app$/ do
  visit '/', :post, "field_name=value"
end

When /^I click on "(.*)"$/ do |text|
  click_link(text)
end

Then /^I should see "(.*)"$/ do |text|
  expect(page.body).to match /#{text}/m
end

Then /^I select "(.*)"$/ do |text|
  select(text,:from => "select")
end

When /^I fill "(.*)" with "(.*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I fill the hidden element "(.*)" with "(.*)"$/ do |field_id, value|
  find("##{field_id}",:visible => false).set value
end

When /^I press "(.*)"$/ do |name|
  click_button(name)
end

#Then I should see the image "google.png"
#<img src="google.png" alt="google">
Then(/^I should see the image "(.*?)"$/) do |image_name|
  expect(page).to have_xpath("//img[@src=\"#{image_name}\"]")
end

# Check the content of a specific table cell
# To use this, every cell should have a unique ID like XX:YY (1:3)
Then(/^I should see "(.*?)" at the cell (\d+),(\d+)$/) do |text, x, y|
  cell = "##{x}-#{y}"
  expect(find(cell).text).to match /#{text}/m
end


#other options:
#find_field('First Name').value
#find_link('Hello', :visible => :all).visible?
#find_button('Send').click

#find(:xpath, "//table/tr").click
#find("#overlay").find("h1").click
#all('a').each { |a| a[:href] }

#see more: https://github.com/jnicklas/capybara
