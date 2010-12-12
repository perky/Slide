Given /^I have threads titled (.+)$/ do |titles|
  titles.split(", ").each do |title|
    user = Factory.create( :user )
    Factory.create( :ForumThread, :user => user, :title => title )
  end
end

Given /^I have no threads$/ do
  ForumThread.delete_all
end

