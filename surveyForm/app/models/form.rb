class Form < ActiveRecord::Base
    validates :name, :location, :language, presence: true
    validates :name, length: { in: 2..20 }
end
