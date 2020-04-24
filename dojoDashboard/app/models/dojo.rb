class Dojo < ActiveRecord::Base
    validates :branch, presence: true, length: { in: 2..25}
    validates :street, presence: true, length: { in: 4..35}
    validates :city, presence: true, length: { in: 2..25}
    validates :state, presence: true
    has_many :students
end
