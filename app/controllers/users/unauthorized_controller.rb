class Users::UnauthorizedController < ApplicationController
  skip_before_action :authenticate_user! #, only: [:peek_preview]

  def unauthorized
  end
end
