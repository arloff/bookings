# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts/edit', type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
                                  street: 'MyString',
                                  city: 'MyString',
                                  postalCode: 'MyString',
                                  phone: 'MyString',
                                  email: 'MyString'
                                ))
  end

  it 'renders the edit contact form' do
    render

    assert_select 'form[action=?][method=?]', contact_path(@contact), 'post' do
      assert_select 'input[name=?]', 'contact[street]'

      assert_select 'input[name=?]', 'contact[city]'

      assert_select 'input[name=?]', 'contact[postalCode]'

      assert_select 'input[name=?]', 'contact[phone]'

      assert_select 'input[name=?]', 'contact[email]'
    end
  end
end
