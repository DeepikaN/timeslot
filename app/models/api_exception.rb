class ApiException < StandardError

  MINUTE_SELECTION = 15

  attr_accessor :code, :message

  ERROR_DESCRIPTIONS = {
    101 => "Invalid or missing.",
    103 => "Invalid datetime selection",
    104 => "End time should be greater than start time",
    105 => "Invalid request",
    500 => "Unknown error."
  }.freeze

  ERROR_CODES = ERROR_DESCRIPTIONS.keys

  def initialize(code, arg = "")
    code = 500 if ERROR_CODES.exclude?(code)
    self.code = code
    self.message = arg + ERROR_DESCRIPTIONS[code]
  end

  def valid_time_span?(params)
    (((params[:end_time].to_datetime - params[:start_time].to_datetime)  * 24 * 60) % MINUTE_SELECTION == 0) == false
  end

end
