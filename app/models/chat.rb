class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  has_many :messages

  validate :sender_and_receiver_must_be_different
  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  private
  def sender_and_receiver_must_be_different
    if receiver_id == sender_id
      errors.add(:base, "Sender and receiver must be different")
    end
  end
end
