json.extract! contact, :id, :name, :surname, :phone, :email, :web, :city, :address, :country_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)