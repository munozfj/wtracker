require 'spec_helper'

describe "app_parameters/index" do
  before(:each) do
    assign(:app_parameters, [
      stub_model(AppParameter,
        :group => "",
        :code => "Code",
        :value => "Value",
        :description => "Description"
      ),
      stub_model(AppParameter,
        :group => "",
        :code => "Code",
        :value => "Value",
        :description => "Description"
      )
    ])
  end

  it "renders a list of app_parameters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
