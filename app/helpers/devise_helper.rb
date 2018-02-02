module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation" class="alert alert-danger alert-with-icon" data-notify="container">
      <div class="container">
        <div class="alert-wrapper">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <i class="nc-icon nc-simple-remove"></i>
          </button>
          <div class="message">
            #{sentence}
            #{messages}
          </div>
        </div>
      </div>
    </div>    
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end