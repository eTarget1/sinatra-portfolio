class Contact < ActiveRecord::Base
    validates :fullname, presence: true
    validates :phone, presence: true
    validates :email, presence: true
    validates :message, presence: true
end 