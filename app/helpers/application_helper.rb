module ApplicationHelper
  def current_path_translated_to(locale)
    url_for(locale:, controller: controller.controller_name, action: controller.action_name, only_path: true)
  end
end
