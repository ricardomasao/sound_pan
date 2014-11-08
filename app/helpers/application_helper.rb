module ApplicationHelper

  def require_module

    script = "<script type='text/javascript'>\n"
    script += "jQuery(function(){ var Layout = require('views/layouts/layout'); var CClass = require('views/" + controller.controller_name + "/" + controller.action_name + "'); window.bblend_current_view = new CClass})\n"
    script += "</script>"

    return script.html_safe;

  end

end
