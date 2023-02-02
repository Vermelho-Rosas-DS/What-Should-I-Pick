class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :set_default_page_title

  def home
  end

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end

  private

  def set_default_page_title
    @page_title = 'What Should I Pick'
  end
end
