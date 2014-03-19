require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :user_id => 1,
      :comment => "MyText"
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do
      assert_select "input#photo_user_id[name=?]", "photo[user_id]"
      assert_select "textarea#photo_comment[name=?]", "photo[comment]"
    end
  end
end
