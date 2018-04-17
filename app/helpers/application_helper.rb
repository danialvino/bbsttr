module ApplicationHelper

def custom_bootstrap_flash
  flash_messages = []
  flash.each do |type, message|
    type = 'success' if type == 'notice'
    type = 'error'   if type == 'alert'
    text = "<script>toastr.#{type}('#{message}');</script>"
    flash_messages << text.html_safe if message
  end
  flash_messages.join("\n").html_safe
end

def simple_pluralize count, singular, plural=nil
  ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
end
end

