

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
