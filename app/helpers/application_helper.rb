module ApplicationHelper
  def current_locale
    cookies[:locale] ||= I18n.default_locale
  end
end
