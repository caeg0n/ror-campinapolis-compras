class Contact < ApplicationRecord
  validates :phone_number, uniqueness: true
end
