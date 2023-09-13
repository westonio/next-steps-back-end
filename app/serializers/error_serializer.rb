class ErrorSerializer
  include JSONAPI::Serializer
  def initialize(error_message)
    @message = format_errors(error_message)
  end

  def self.format_errors(error)
    {
      errors: [
        {
          detail: error
        }
      ]
    }
  end
end