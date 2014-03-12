require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :user_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :nickname => "MyString",
      :email => "MyString",
      :gender => "MyString",
      :height => 1.5,
      :activity_type => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do
      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
      assert_select "input#profile_first_name[name=?]", "profile[first_name]"
      assert_select "input#profile_last_name[name=?]", "profile[last_name]"
      assert_select "input#profile_nickname[name=?]", "profile[nickname]"
      assert_select "input#profile_email[name=?]", "profile[email]"
      assert_select "input#profile_gender[name=?]", "profile[gender]"
      assert_select "input#profile_height[name=?]", "profile[height]"
      assert_select "input#profile_activity_type[name=?]", "profile[activity_type]"
    end
  end
end
