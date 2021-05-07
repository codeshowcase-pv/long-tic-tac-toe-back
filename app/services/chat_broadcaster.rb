# frozen_string_literal: true

module ChatBroadcaster
  def self.call(recipient_id, text)
    ActionCable.server.broadcast "notifications_channel_#{recipient_id}", text: text
  end
end
