require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :user_id => 1,
      :comment => "MyText"
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#photo_user_id[name=?]", "photo[user_id]"
      assert_select "textarea#photo_comment[name=?]", "photo[comment]"
    end
  end
end
