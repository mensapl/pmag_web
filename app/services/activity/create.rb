require 'dry-monads' 

class Activity::Create

  class << self
    include Dry::Monads::Either::Mixin
    def call(creator, form)
      @creator = creator

      Right(form)
        .bind(method(:check_form_validity))
        .bind(method(:create_activity))
    end

    private

    def check_form_validity(form)
      validation = ActivityValidator.new(form).validate
      return Left(validation.errors) unless validation.success?
      Right(form)
    end

    def create_activity(form)
      activity = @creator.created_activities.create!(form.merge(accepted: false))
      Right(activity)
    end
  end
end
