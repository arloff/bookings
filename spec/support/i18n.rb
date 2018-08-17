# frozen_string_literal: true

def t(string, options = {})
  I18n.t(string, options)
end

def l(object, options = {})
  I18n.l(object, options)
end
