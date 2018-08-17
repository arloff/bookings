require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :street => "MyString",
      :city => "MyString",
      :postalCode => "MyString",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[street]"

      assert_select "input[name=?]", "contact[city]"

      assert_select "input[name=?]", "contact[postalCode]"

      assert_select "input[name=?]", "contact[phone]"

      assert_select "input[name=?]", "contact[email]"
    end
  end
end
