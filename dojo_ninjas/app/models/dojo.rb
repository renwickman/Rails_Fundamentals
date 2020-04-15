class Dojo < ActiveRecord::Base
    validates :name, presence: true
    validates :city, presence: true, length: { in: 2..20}
    validates :state, presence: true, length: { in: 2..3}
    has_many :ninjas, dependent: :destroy
end
