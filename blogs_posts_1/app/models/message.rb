class Message < ActiveRecord::Base
    validates :author, presence: true
    validates :message, presence: true, length: { minimum: 15 }
    belongs_to :post
end
