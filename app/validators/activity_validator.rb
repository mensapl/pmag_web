require 'hanami/validations/form'

class ActivityValidator
  include Hanami::Validations::Form

  validations do
    required(:title) { filled? & str? & size?(3..64) }
    required(:description) { filled? & str? }
    required(:start_time) { filled? & time? }
    required(:end_time) { filled? & time? }
  end
end
