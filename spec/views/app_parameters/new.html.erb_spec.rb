require 'spec_helper'

describe "app_parameters/new" do
  before(:each) do
    assign(:app_parameter, stub_model(AppParameter,
      :group => "",
      :code => "MyString",
      :value => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new app_parameter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", app_parameters_path, "post" do
      assert_select "input#app_parameter_group[name=?]", "app_parameter[group]"
      assert_select "input#app_parameter_code[name=?]", "app_parameter[code]"
      assert_select "input#app_parameter_value[name=?]", "app_parameter[value]"
      assert_select "input#app_parameter_description[name=?]", "app_parameter[description]"
    end
  end
end
