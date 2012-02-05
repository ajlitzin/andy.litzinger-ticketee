Then /^I should see the "([^"]*)" link$/ do |text|
  page.should(have_css("a", text: text), "Expected to see the #{text.inspect} link, but did not.")
end

Then /^I should not see the "([^"]*)" link$/ do |text|
  page.should_not(have_css("a", text: text), "Expected to not see the #{text.inspect} link, but did.")
end

Given /^I am signed in as "([^"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as them")
end

