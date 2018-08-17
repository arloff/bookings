# frozen_string_literal: true

def select_date(date, options = {})
  date = Date.parse(date) if date.class == String
  field = options[:from]
  base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
  month = I18n. t('date.month_names')[date.month]
  select date.year, from: "#{base_id}_1i"
  select month, from: "#{base_id}_2i"
  select date.day, from: "#{base_id}_3i"
end

def select_time(time, options = {})
  hour, minute = time.split(':')
  field = options[:from]
  base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
  select hour, from: "#{base_id}_4i"
  select minute, from: "#{base_id}_5i"
end
