class Device < ActiveRecord::Base
    validates :name, presence: true, length: { maximum: 50 }
    validates :userid, presence: true
    
end
