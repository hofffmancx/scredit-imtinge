class Message < ApplicationRecord

  def read!
    self.is_unread = false
    self.save
  end
end
