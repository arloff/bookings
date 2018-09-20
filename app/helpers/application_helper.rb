# frozen_string_literal: true

# Generated by Rails
module ApplicationHelper
  # see https://getbootstrap.com/docs/4.0/components/alerts/
  FLASH_LEVELS = { error: 'alert alert-danger',
                   alert: 'alert alert-warning',
                   notice: 'alert alert-success',
                   success: 'alert alert-success' }.freeze

  def bootstrap_class_for(name)
    FLASH_LEVELS[name.to_sym]
  end
end
