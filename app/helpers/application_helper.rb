module ApplicationHelper

    def bootstrap_class_for flash_type
        { alert: "alert-danger", notice: "alert-success" }.stringify_keys[flash_type.to_s] || flash_type.to_s
    end
    
    def flash_messages(opts = {})
        flash.each do |msg_type, message|
          concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
                  concat message 
                end)
        end
        nil
    end
end
