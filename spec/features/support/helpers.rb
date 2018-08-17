# frozen_string_literal: true

def attributes(model_name)
  h = {'person' => %w[first_name last_name salutation],
       'contact' => %w[email street city postalCode phone]}
  h[model_name]
end

def create_booking(booking)
  visit new_booking_path(locale: :de)

  fill_in_booking(booking)
  fill_in_data(booking.person)
  fill_in_data(booking.contact)
  click_button(t('helpers.submit.create', model: Booking.model_name.human))
  #click_button 'Buchungsanfrage erstellen'
end

def fill_in_data(model)
  model_name = model.class.name.downcase
  attributes = attributes(model_name)
  within("##{model_name}-form") do
    attributes.each do |a|
      fill_in t("activerecord.attributes.#{model_name}.#{a}"),
              with: model.send(a)
    end
  end
end

def fill_in_booking(booking)
  within('#booking-form') do
    select_date(booking.date_in,
                from: t('activerecord.attributes.booking.date_in'))
    select_date(booking.date_out,
                from: t('activerecord.attributes.booking.date_out'))
    fill_in t('activerecord.attributes.booking.no_persons'),
            with: booking.no_persons
  end
  within('#booking-form-comment') do
    fill_in t('activerecord.attributes.booking.comment'),
            with: booking.comment
  end
end

def text_re(one, two)
  Regexp.new("#{one}.*#{two}")
end

def expect_page_to_have_label_content_pair(label, content)
  expect(page).to have_content(text_re(t(label), content))
end

def expect_page_to_have_label_content_pairs(list)
  list.each do |label, content|
    expect_page_to_have_label_content_pair(label, content)
  end
end

def check_for_booking_data(booking)
  expect_page_to_have_label_content_pairs(
    [['activerecord.attributes.booking.date_in', format_date(booking.date_in)],
     ['activerecord.attributes.booking.date_out', format_date(booking.date_out)],
     ['activerecord.attributes.booking.comment', booking.comment],
     ['activerecord.attributes.booking.no_persons', booking.no_persons]]
  )
end

def check_for_data(model)
  model_name = model.class.name.downcase
  attributes = attributes(model_name)
  pairs = attributes.map { |a|
    ["activerecord.attributes.#{model_name}.#{a}", model.send(a)] }
  expect_page_to_have_label_content_pairs(pairs)
end
