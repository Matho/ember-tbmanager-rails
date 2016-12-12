class Country < ApplicationRecord
  validates_presence_of :title, :code

  has_many :contacts
end
