require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :nickname => "Nickname",
        :email => "Email",
        :gender => "Gender",
        :height => 1.5,
        :activity_type => "Activity Type"
      ),
      stub_model(Profile,
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :nickname => "Nickname",
        :email => "Email",
        :gender => "Gender",
        :height => 1.5,
        :activity_type => "Activity Type"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Activity Type".to_s, :count => 2
  end
end
