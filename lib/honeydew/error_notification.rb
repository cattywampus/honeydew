module Honeydew
  class ErrorNotification
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    def initialize(errors, options={})
      @errors = errors
      @options = {
        message: 'Please review the problems below:',
        id: 'error_notification',
        class: 'alert alert-danger'
      }.merge(options)
    end

    def render
      buffer = ActiveSupport::SafeBuffer.new
      content_tag :div, id: @options[:id], class: @options[:class] do
        buffer << content_tag(:h4, @options[:message])
        buffer << content_tag(:ul, class: 'list-unstyled') do
          @errors.to_a.map { |e| "<li>#{e}</li>" }.join("").html_safe
        end
        buffer
      end
    end
  end
end
