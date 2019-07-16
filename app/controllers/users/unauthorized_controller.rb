# frozen_string_literal: true

class Users::UnauthorizedController < ApplicationController
  skip_before_action :authenticate_user! # , only: [:peek_preview]
  skip_authorization_check

  def unauthorized; end
end
