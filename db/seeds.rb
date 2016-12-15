# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


countries = Country.create!([
                                {:title=>"Slovenská republika", :code=>"sk"},
                                {:title=>"Česká republika", :code=>"cz"},
                                {:title=>"Maďarsko", :code=>"hu"}

                            ])


20.times do |i|
  Contact.create!(:name=>"name #{i}", :surname=>"surname #{i}", :phone =>"phone #{i}", :email=>"meno#{i}@matho.sk", :web=>"web#{i}", :city=>"city#{i}",
                 :address=>"address#{i}", :country_id=> countries[0].id )
end

