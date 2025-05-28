# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Job.destroy_all
User.destroy_all
Country.destroy_all


for n in 1..10 do
    User.create!(
        email: Faker::Internet.email(domain: 'gmail.com'),
        password: "password",
        nationality: Faker::Nation.nationality,
        date_of_birth: Faker::Date.between(from: '1950-01-01', to: '2010-01-01'),
    )
    puts "Seeding user #{n}"
end

for n in 1..10 do
    Country.create!(
        name: Faker::Address.unique.country,
        information: {
            About: Faker::Lorem.paragraph(sentence_count: 5),
            Culture: Faker::Lorem.paragraph(sentence_count: 5),
            Cities: [
                Faker::Address.city,
                Faker::Address.city,
                Faker::Address.city,
                ],
            Jobs: [
                Faker::Job.field,
                Faker::Job.field,
                Faker::Job.field,
                ],
            },
        image_url: "https://t4.ftcdn.net/jpg/01/71/06/95/360_F_171069544_OmDwEP1gLIGJGnqAxWXWsLPuck49lMM0.jpg",
        longitude: Faker::Number.normal(mean: 0, standard_deviation: 180).round(4),
        latitude: Faker::Number.normal(mean: 0, standard_deviation: 90).round(4)
    )
    puts "Seeding country #{n}"
end

for n in 1..20 do
    Job.create!(
        company_name: Faker::Company.name,
        description: {
            Salary: "£" + Faker::Number.between(from: 30000, to: 120000).to_s,
            Field: Faker::Job.field,
            Postion: Faker::Job.position,
            Seniority: Faker::Job.seniority,
            Employment_Type: Faker::Job.employment_type,
            Languages: Faker::Nation.language,
            Country: Faker::Address.country,
            Description: Faker::Lorem.paragraph(sentence_count: 5),
            },
        requirements: [
            Faker::Job.key_skill,
            Faker::Job.key_skill,
            Faker::Job.key_skill,
            Faker::Job.key_skill,
            ],
        location: Faker::Address.city,
        job_title: Faker::Job.title,
        country_id: rand(Country.first.id..Country.last.id),
        longitude: Faker::Number.normal(mean: 0, standard_deviation: 180).round(4),
        latitude: Faker::Number.normal(mean: 0, standard_deviation: 90).round(4),
    )
    puts "Seeding job #{n}"
end
