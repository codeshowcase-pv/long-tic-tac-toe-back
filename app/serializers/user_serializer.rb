# frozen_string_literal: true

class UserSerializer < Blueprinter::Base
  identifier :id

  view :cache do
    exclude :id
    field :name
  end
end
