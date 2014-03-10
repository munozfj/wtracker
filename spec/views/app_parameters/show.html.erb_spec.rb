require 'spec_helper'

describe "app_parameters/show" do
  before(:each) do
    @app_parameter = assign(:app_parameter, stub_model(AppParameter,
      :group => "",
      :code => "Code",
      :value => "Value",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Code/)
    rendered.should match(/Value/)
    rendered.should match(/Description/)
  end
end
