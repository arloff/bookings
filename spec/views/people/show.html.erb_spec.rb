# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/show', type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
                                first_name: 'First Name',
                                last_name: 'Last Name',
                                salutation: 'Salutation'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Salutation/)
  end
end