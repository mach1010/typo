When /^I enter a uri for the edit page for "Category" with id "1"/ do
  expect { visit '/admin/categories/edit/1' }.to_not raise_error
end

When /^Categories/ do
  expect { click_link 'Categories'}.should_not raise_error(ActiveRecord::RecordNotFound)
end
