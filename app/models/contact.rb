class Contact < ApplicationRecord
  validates_presence_of :name, :surname,:phone,:email,:web, :city,:address,:country_id
  validates_numericality_of :country_id
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  belongs_to :country

end
