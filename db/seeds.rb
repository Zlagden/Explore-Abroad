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

JobApplication.destroy_all
Job.destroy_all
User.destroy_all
Country.destroy_all

dummy_user = User.new(
    email: "tester@gmail.com",
    password: "123456",
    nationality: Faker::Nation.nationality,
    date_of_birth: Faker::Date.between(from: '1950-01-01', to: '2010-01-01'),   
)
dummy_user.save
puts "Created Dummy User /email: #{dummy_user[:email]}/, /password: 123456 /"

for n in 1..10 do
    User.create!(
        email: Faker::Internet.email(domain: 'gmail.com'),
        password: "password",
        nationality: Faker::Nation.nationality,
        date_of_birth: Faker::Date.between(from: '1950-01-01', to: '2010-01-01'),
    )
    puts "Seeding user #{n}"
end


    Country.create!([
  {
    name: "Japan",
    information: {
      About: "Japan is an island country in East Asia, located in the northwest Pacific Ocean. It is known for its rich history, technological innovation, and vibrant culture.",
      Culture: "Japanese culture blends traditional values such as respect and harmony with modernity. Customs like tea ceremonies, festivals, and martial arts are deeply rooted in society.",
      Cities: ["Tokyo", "Kyoto", "Osaka"],
      Jobs: ["Technology", "Automotive", "Tourism"]
    },
    image_url: "https://d1shf7n3qgesaf.cloudfront.net/wp-content/uploads/20240521155503/BALCountryOverview_Japan.webp",
    longitude: 138.2529,
    latitude: 36.2048
  },
  {
    name: "France",
    information: {
      About: "France is a Western European country with a rich cultural heritage, famous for its art, cuisine, and historical landmarks like the Eiffel Tower and the Louvre.",
      Culture: "French culture emphasizes philosophy, fashion, and fine dining. It values intellectual discourse and has deep roots in the arts and literature.",
      Cities: ["Paris", "Lyon", "Marseille"],
      Jobs: ["Fashion", "Aerospace", "Tourism"]
    },
    image_url: "https://www.frenchclass.in/wp-content/uploads/2024/01/cities-in-france-paris-laforet.webp",
    longitude: 2.2137,
    latitude: 46.2276
  },
  {
    name: "Brazil",
    information: {
      About: "Brazil is the largest country in South America, known for its diverse ecosystems like the Amazon rainforest, and vibrant cities like Rio de Janeiro.",
      Culture: "Brazilian culture is a melting pot of indigenous, African, and Portuguese influences. It's famous for Carnival, samba, and soccer.",
      Cities: ["São Paulo", "Rio de Janeiro", "Brasília"],
      Jobs: ["Agriculture", "Mining", "Tourism"]
    },
    image_url: "https://delivery.gfobcontent.com/api/public/content/b5b22ce1ceb5489682db98d8186c4f73?v=40928581",
    longitude: -51.9253,
    latitude: -14.2350
  },
  {
    name: "Canada",
    information: {
      About: "Canada is the second-largest country in the world, known for its natural landscapes, multicultural cities, and high quality of life.",
      Culture: "Canadian culture values inclusivity, outdoor life, and bilingualism. Ice hockey, maple syrup, and politeness are iconic.",
      Cities: ["Toronto", "Vancouver", "Montreal"],
      Jobs: ["Technology", "Energy", "Healthcare"]
    },
    image_url: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcRCZs9tDtSpJP2hifq1WJJ4ABSV9BHB0JP_NjfbEGGkJKzQwTp-arDdFljbCZcEnxVBKt2qlXFzp3SKCiUKoVcHAnnvfSICEMkUsb8W1g",
    longitude: -106.3468,
    latitude: 56.1304
  },
  {
    name: "India",
    information: {
      About: "India is a South Asian country with a population of over 1.4 billion. It is known for its ancient civilization, festivals, and diverse languages and religions.",
      Culture: "Indian culture is characterized by a mix of spiritual traditions, classical arts, cuisine, and strong family values.",
      Cities: ["Delhi", "Mumbai", "Bangalore"],
      Jobs: ["Information Technology", "Pharmaceuticals", "Textiles"]
    },
    image_url: "https://lh3.googleusercontent.com/gps-cs-s/AC9h4np_CAY_mkgruVA5-bP_mch9E5wgYp_axowCxvEWwZOittCjzb0ycdpWXJ82-CbGaSyARzPGKBF8GqjMYkf4VF3OhYkbjAhgcpEx1-KEzzg9_9LZ4vT8ksg4NF2mDH6gTLR4g2E-=w1080-h624-n-k-no",
    longitude: 78.9629,
    latitude: 20.5937
  },
  {
    name: "Germany",
    information: {
      About: "Germany is a central European country known for its engineering, historical landmarks, and strong economy.",
      Culture: "German culture emphasizes precision, efficiency, and a deep appreciation for philosophy, music, and beer festivals.",
      Cities: ["Berlin", "Munich", "Frankfurt"],
      Jobs: ["Automotive", "Engineering", "Finance"]
    },
    image_url: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcSVMTxXdNsIQm9oQ5JPPREFGXQ8ES-5nVfLw_vv9J-bZdMs6vHnZwBnFC8Cq82gI3lPuYIruh6tSsV1c-Fr3Xd0Uyq60ZhL8CPlr1Golw",
    longitude: 10.4515,
    latitude: 51.1657
  },
  {
    name: "Australia",
    information: {
      About: "Australia is a vast country and continent known for its unique wildlife, coastal cities, and the Outback.",
      Culture: "Australian culture is laid-back, sport-oriented, and diverse due to its history of immigration.",
      Cities: ["Sydney", "Melbourne", "Brisbane"],
      Jobs: ["Mining", "Education", "Tourism"]
    },
    image_url: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcT-sVcZhh2HQhATZHOx0eAeJ3Q_q6THgxRZkqKupL2ltWDjof8Gsk_nKqyj-Z0Q9bNxwtElkVeJDRt1cPqElHteAo8Ask8Pg6cKF58uzA",
    longitude: 133.7751,
    latitude: -25.2744
  },
  {
    name: "Italy",
    information: {
      About: "Italy is a southern European country famous for its rich history, Roman ruins, Renaissance art, and world-renowned cuisine.",
      Culture: "Italian culture treasures family, fashion, and food. It has made significant contributions to art, music, and architecture.",
      Cities: ["Rome", "Florence", "Milan"],
      Jobs: ["Fashion", "Tourism", "Manufacturing"]
    },
    image_url: "https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQxb7Gx_z_uyF9yger2ahCbt4upYJGM0D2BozCtTfPWUTU7EWSy7_wqJpgIwPETmihCed6l2auzxnVtIDZzgnPqn93jc4OnQm7hRSH4eQ",
    longitude: 12.5674,
    latitude: 41.8719
  },
  {
    name: "South Africa",
    information: {
      About: "South Africa is a diverse country located at the southern tip of Africa, known for its wildlife, natural beauty, and complex history.",
      Culture: "South African culture is multi-ethnic and includes influences from African, Dutch, British, and Indian traditions.",
      Cities: ["Johannesburg", "Cape Town", "Durban"],
      Jobs: ["Mining", "Tourism", "Agriculture"]
    },
    image_url: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcSlgF2dXC-_gxqDDA0thQ1PVX669-lhsohZXSnQCqBWhOGF4wuRuG6_0nUtJOWbnCKYWNAFXlgTwp_rB6vNYCn_Ki_T3NCRgWADL_NoNA",
    longitude: 22.9375,
    latitude: -30.5595
  },
  {
    name: "United States",
    information: {
      About: "The United States is a large country in North America known for its global influence in politics, culture, and technology.",
      Culture: "American culture is diverse and shaped by immigration. It places a high value on individualism, innovation, and freedom.",
      Cities: ["New York", "Los Angeles", "Chicago"],
      Jobs: ["Technology", "Finance", "Entertainment"]
    },
    image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOESC84bwsx3d2uOWgYvpN8OomrXZ6E9vrHQ&s",
    longitude: -95.7129,
    latitude: 37.0902
  }
])
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

for n in 1..20 do
    JobApplication.create!(
        user_id: rand(User.first.id..User.last.id),
        job_id: rand(Job.first.id..Job.last.id),
        cv: Faker::File.mime_type,
        cover_letter: Faker::File.mime_type,
    )
    puts "Seeding job_application #{n}"
end



