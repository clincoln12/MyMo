module ApplicationHelper
  def alert_class(flash_type)
    case flash_type.to_sym
    when :notice
      "alert-success"
    when :alert
      "alert-warning"
    when :error
      "alert-danger"
    end
  end

  def button_text
    if controller.action_name == "new"
      "Create"
    elsif controller.action_name == "edit"
      "Update"
    else
      "Submit"
    end
  end
end
