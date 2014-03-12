require 'spec_helper'

describe "profiles/show" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :user_id => 1,
      :first_name => "First Name",
      :last_name => "Last Name",
      :nickname => "Nickname",
      :email => "Email",
      :gender => "Gender",
      :height => 1.5,
      :activity_type => "Activity Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Nickname/)
    rendered.should match(/Email/)
    rendered.should match(/Gender/)
    rendered.should match(/1.5/)
    rendered.should match(/Activity Type/)
  end
end
