# frozen_string_literal: true

# Generated by Rails
class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def self.default_url_options(options = {})
    options.merge(locale: I18n.locale)
  end

  def authenticate_active_admin_user!
    user = authenticate_user!
    throw(:warden) unless user.admin?
  end

  # protected
# 
  # def authenticate_user!
  #   if user_signed_in?
  #     redirect_to unauthorized_path
  #     # super
  #   else
  #     super
  #     #redirect_to unauthorized_path
  #     ## if you want render 404 page
  #     ## render :file => File.join(Rails.root, 'public/404'),
  #     # :formats => [:html], :status => 404, :layout => false
  #   end
  # end
end
