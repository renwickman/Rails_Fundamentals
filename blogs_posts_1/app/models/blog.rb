class Blog < ActiveRecord::Base
    validates :name, presence: true
    validates :description, presence: true
    has_many :posts, dependent: :destroy
end
