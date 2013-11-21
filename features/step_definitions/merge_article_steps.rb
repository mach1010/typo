#require 'uri'
#require 'cgi'
#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

# Treat two args that should both be found in a page
Then /^I should see "(.*?)" and "(.*?)"$/ do |arg1, arg2|
  if arg1 == arg2
    assert page.body.count(arg1) > 1
  else
    first = page.body.index(arg1)
    assert first > 0
    second = page.body.rindex(arg2)
    assert second > (first + arg1.length) 
  end

end

Given /^the following articles exist/ do |table|
  #arts = Content.create!(table.hashes)
  #delete_all then assert Content.all.count == 3
  already_there = Article.count
  arts = Article.create!(table.hashes)
  Article.count.should be > 0
  table.hashes.length.should == (Article.count - already_there)
end

Given /^the following comments exist/ do |table|
  already_there = Comment.count
  comments = Comment.create!(table.hashes)
  table.hashes.length.should == (Comment.count - already_there)
end
