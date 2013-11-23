Given /^the following articles exist/ do |table|
  already_there = Article.count
  Article.create!(table.hashes)
  Article.count.should be > 0
  table.hashes.length.should == (Article.count - already_there)
end

Given /^the following comments exist/ do |table|
  already_there = Comment.count
  Comment.create!(table.hashes)
  table.hashes.length.should == (Comment.count - already_there)
end

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

Given /^the following articles exist/ do |article_table|
  Article.create!(article_table.hashes)
end

Given /^the following comments exist/ do |comment_table|
  Comment.create!(comment_table.hashes)
end

When /^I log out/ do
  visit '/accounts/logout/'
end
