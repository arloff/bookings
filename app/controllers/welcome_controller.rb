# frozen_string_literal: true

# Controller for Pages not Associated with resources, like the Startpage
# Or the not authorized page.
class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:startpage]
  skip_authorization_check only: [:startpage]
  def startpage; end
end
