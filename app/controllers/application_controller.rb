class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def change_locale
    l = params[:locale].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    cookies.permanent[:locale] = l
    redirect_to request.referer || root_url
  end

  private

  def set_locale
    if cookies[:locale] && I18n.available_locales.include?(cookies[:locale].to_sym)
      l = cookies[:locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:locale] = l
    end
    I18n.locale = l
  end
end
