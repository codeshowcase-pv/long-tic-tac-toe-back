# frozen_string_literal: true

def error_messages_of(model)
  model.errors.full_messages.join('. ')
end
