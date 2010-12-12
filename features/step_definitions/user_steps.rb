def user
  @user ||= Factory :user
end

def login
  user
  visit login_path
  fill_in "login", :with => @user.username
  fill_in "password", :with => @user.password
  click_button "Log in"
end

Given /^I am logged on as "(.+)"$/ do |name|
  @user = Factory.create( :user, :username => name )
  login
end

Given /^I am logged in$/ do
  login
end

Given /^I am logged out$/ do
  visit logout_path
end

Given /^no users exist$/ do
  User.delete_all
end

When /^I login as "(.+)"$/ do |name|
  @user = Factory.build( :user, :username => name )
  login
end