Given /the following (.*?)s exist$/ do |model, table|
  table.hashes.each do |row|
    model.capitalize.constantize.create(row)
  end
end

Then /"(.*?)" should be author of "(.*?)"$/ do |user, article|
  Article.find_by_title(article).author == user
end

Given /I am logged in as "(.*?)" with password "(.*?)"$/ do |user, password|
  visit '/accounts/login'
  fill_in 'user_login', with: user
  fill_in 'user_password', with: password
  click_button 'Login'
  assert page.has_content? 'Login successful'
end