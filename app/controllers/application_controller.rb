class ApplicationController < ActionController::Base
  def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      #cureent_user.locale
      #request.env["HTTP_ACCEPT_LANGUAGE"]
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
