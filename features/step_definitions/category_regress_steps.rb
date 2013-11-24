When /^I enter a uri for the edit page for "Category" with id "1"/ do
  expect { visit '/admin/categories/edit/1' }.to_not raise_error
end


When /^I try to follow the broken "Categories" link/ do
  expect { visit '/admin/categories/new'}.to raise_error(ActiveRecord::RecordNotFound)
  visit '/admin/categories/edit/1' rescue  save_and_open_page
end

When /^I log out/ do
  visit '/accounts/logout/'
end


=begin
require "spec_helper"

describe "Widget management" do

  it "creates a Widget and redirects to the Widget's page" do
    get "/widgets/new"
    expect(response).to render_template(:new)

    post "/widgets", :widget => {:name => "My Widget"}

    expect(response).to redirect_to(assigns(:widget))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Widget was successfully created.")
  end

end
=end
