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
    assert second != first && second > (first + arg1.length) 
  end

end

Given /^the following articles exist/ do |table|
  Article.create!(table.hashes)
end

Given /^the following comments exist/ do |table|
  # table is a Cucumber::Ast::Table
  Comment.create!(table.hashes)
end
