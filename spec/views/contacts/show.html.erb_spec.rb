require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :street => "Street",
      :city => "City",
      :postalCode => "Postal Code",
      :phone => "Phone",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
  end
end
