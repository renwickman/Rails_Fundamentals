class Post < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 7 }
    validates :content, presence: true
    has_many :messages, dependent: :destroy
    belongs_to :blog
end
