# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'gives initials' do
    p = build(:person)
    expect(p.initials).to eq('JD')
  end
end
