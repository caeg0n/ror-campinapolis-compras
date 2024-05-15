class Notification < ApplicationRecord
  enum device_class: [:client,:organization,:deliveryman]
end
