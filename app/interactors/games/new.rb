# frozen_string_literal: true

module Games
  class New
    include Interactor::Organizer

    organize Create, Boards::GenerateField, Boards::Create
  end
end
