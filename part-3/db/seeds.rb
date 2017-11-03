puts "Seeding the database ..."


def seed_restaurant_table
  puts "Seeding the restaurant table..."
  total_seeds_required = 50
  current_seeds_in_db = Restaurant.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["name:string", "cuisine:string", "address:string", "city:string", "state:string", "zip:string", "user_id:integer"]
  seeds_to_create.times do
    # restaurant_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_restaurant_record = Restaurant.new(restaurant_hash)
    new_restaurant_record.save!
  end

end
seed_restaurant_table


def seed_review_table
  puts "Seeding the review table..."
  total_seeds_required = 50
  current_seeds_in_db = Review.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["user_id:integer", "restaurant_id:integer", "rating:integer", "description:string"]
  seeds_to_create.times do
    # review_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_review_record = Review.new(review_hash)
    new_review_record.save!
  end

end
seed_review_table


