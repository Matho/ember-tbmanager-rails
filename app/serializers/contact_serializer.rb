class ContactSerializer < ActiveModel::Serializer
  attributes :id,:name,:surname,:phone,:email,:web,:city,:address,:country_id
  belongs_to :country
end
