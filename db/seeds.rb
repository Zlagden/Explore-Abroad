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
    Cities: "Popular cities to live and work in include Tokyo, Kyoto, and Osaka. Tokyo, the bustling capital, offers endless job opportunities in technology, finance, and media, alongside a vibrant city lifestyle. Kyoto is renowned for its historic temples and cultural heritage, attracting those who seek a quieter, tradition-rich environment. Osaka, known for its friendly locals and street food culture, is a commercial hub with strong industries in commerce, manufacturing, and healthcare.",
    Jobs: "Key industries with job opportunities in Japan include technology, automotive, and tourism. Japan’s tech sector is globally renowned, particularly in areas like software development, robotics, and consumer electronics. The automotive industry, led by brands such as Toyota, Honda, and Nissan, offers roles in engineering, manufacturing, and design. Tourism is also a major economic driver, with opportunities in hospitality, travel coordination, language services, and cultural exchange programs.",
    VISA: "Japan allows visa-free travel for up to 90 days for tourists from many countries. For employment, foreign nationals must obtain a work visa such as an Engineer/Specialist in Humanities/International Services visa, typically requiring a job offer and sponsorship from a Japanese company.",
    Highlights: [
      { title: "Public Transport", description: "Japan’s public transportation system is globally recognised for its punctuality, cleanliness, and efficiency. The country’s extensive rail network, including local trains, subways, and the world-famous Shinkansen (bullet train), connects urban centres and rural areas with remarkable speed and reliability." },
      { title: "Cultural Heritage", description: "Japanese cultural heritage is deeply woven into daily life and proudly preserved through centuries-old traditions. From the serene atmosphere of ancient Buddhist temples and Shinto shrines in Kyoto to the artistry of the tea ceremony and the seasonal beauty of cherry blossom festivals, Japan offers a unique cultural experience." },
      { title: "Innovation", description: "Japan is internationally acclaimed for its technological advancements and commitment to innovation. As the birthplace of global tech giants like Sony, Toyota, and Panasonic, Japan has been at the forefront of robotics, AI, and precision manufacturing. The country continues to lead in fields such as autonomous vehicles, renewable energy, and consumer electronics." },
    ],
  },
  image_url: "https://d1shf7n3qgesaf.cloudfront.net/wp-content/uploads/20240521155503/BALCountryOverview_Japan.webp",
  longitude: 138.2529,
  latitude: 36.2048
  },
  {
  name: "France",
  information: {
    About: "France is a Western European country renowned for its cultural richness, historical landmarks, and global influence in fashion, cuisine, and art. With a high quality of life, excellent infrastructure, and a strong economy, France attracts millions of visitors and international professionals every year. Whether you're exploring iconic cities, enjoying countryside vineyards, or working in thriving industries, France offers an exceptional blend of elegance and opportunity.",
    Culture: "French culture values intellectualism, artistic expression, and culinary excellence. From world-class museums and literature to philosophy and haute couture, cultural pride is central to French identity. Social life often revolves around shared meals, discussion, and leisure.",
    Cities: "Key cities to live and work in include Paris, Lyon, and Marseille. Paris, the capital, is a global centre of fashion, business, and the arts, ideal for professionals and creatives alike. Lyon is known for its culinary scene and high quality of life, with strong sectors in banking and tech. Marseille, located along the Mediterranean, offers a more relaxed coastal lifestyle with growing industries in logistics, tourism, and marine sciences.",
    Jobs: "Major employment sectors in France include fashion, aerospace, and tourism. Paris leads in creative and luxury industries, while Toulouse is a hub for aviation and aerospace with companies like Airbus. The tourism sector, supported by historical attractions and diverse landscapes, also offers roles in hospitality, travel management, and cultural preservation.",
    VISA: "France allows visa-free entry for short stays (up to 90 days) for many nationalities, especially within the Schengen Area. For employment, foreign nationals must apply for a long-stay visa, often under the 'Passeport Talent' or 'Salarié' categories. These typically require a work contract, proof of qualifications, and employer sponsorship. Applicants must register with French immigration services after arrival and may apply for residency permits depending on the visa type.",
    Highlights: [
      { "title" => "Art and Architecture", "description" => "France is home to architectural wonders like Notre-Dame, Versailles, and the Eiffel Tower, and hosts world-renowned art collections at the Louvre and Musée d'Orsay." },
      { "title" => "Cuisine and Wine", "description" => "Known for its gourmet cuisine and wine regions like Bordeaux and Champagne, France’s food culture is UNESCO-listed and deeply integrated into daily life." },
      { "title" => "Elegant Lifestyle", "description" => "France offers a refined lifestyle that emphasises balance, leisure, and aesthetic appreciation, from café culture to boutique shopping and scenic countryside retreats." }
      ]
    },
    image_url: "https://www.frenchclass.in/wp-content/uploads/2024/01/cities-in-france-paris-laforet.webp",
    longitude: 2.2137,
    latitude: 46.2276
  },
  {
    name: "Brazil",
    information: {
    About: "Brazil is the largest country in South America and one of the most biodiverse nations in the world. Famous for the Amazon rainforest, vibrant cities, and a dynamic culture, Brazil blends natural beauty with economic potential. From colourful festivals to modern metropolises, Brazil presents a unique environment for both travel and professional opportunities.",
    Culture: "Brazilian culture is a rich fusion of Indigenous, African, and Portuguese influences. Music and dance—especially samba and bossa nova—play a central role in daily life, while religious traditions like Carnival highlight the country's festive spirit and communal values.",
    Cities: "Top cities to live and work in include São Paulo, Rio de Janeiro, and Brasília. São Paulo is Brazil’s financial and business powerhouse, home to a booming startup scene and multinational corporations. Rio de Janeiro, known for its beaches and landmarks like Christ the Redeemer, offers roles in tourism, entertainment, and services. Brasília, the modernist capital, is the centre of government and public sector employment.",
    Jobs: "Prominent industries in Brazil include agriculture, mining, energy, and tourism. São Paulo is a hub for finance, technology, and manufacturing. Brazil is also the world’s largest exporter of coffee, soybeans, and beef, making agribusiness a major employer. In tourism, opportunities exist in eco-tourism, hospitality, and cultural tour operations, particularly in Rio and the northeast.",
    VISA: "Tourists from many countries can visit Brazil visa-free for up to 90 days. For employment, foreigners must obtain a work visa such as the VITEM V (Temporary Work Visa), which typically requires a job offer, employer sponsorship, and proof of qualifications. The employer must register the contract with the Ministry of Labour, and the visa duration generally ranges from 1 to 2 years, with potential for renewal.",
    Highlights: [
      { title: "Natural Wonders", description: "Home to the Amazon rainforest, Iguazu Falls, and the Pantanal wetlands, Brazil is a paradise for nature lovers and ecotourism." },
      { title: "Festivals and Music", description: "Brazilian festivals such as Carnival are world-famous, showcasing samba parades, costumes, and a joyful celebration of cultural identity." },
      { title: "Diverse Economy", description: "As one of the BRICS nations, Brazil has a rapidly developing economy with strong sectors in energy, technology, agriculture, and manufacturing." }
    ]
  },
    image_url: "https://delivery.gfobcontent.com/api/public/content/b5b22ce1ceb5489682db98d8186c4f73?v=40928581",
    longitude: -51.9253,
    latitude: -14.2350
  },
  {
    name: "Canada",
    information: {
    About: "Canada is the second-largest country in the world, known for its stunning natural landscapes, multicultural population, and high quality of life. It consistently ranks among the best countries for safety, healthcare, and education, making it an appealing destination for both living and working abroad.",
    Culture: "Canadian culture values diversity, inclusivity, and politeness. Influenced by Indigenous traditions, French and British colonial heritage, and global immigration, Canada fosters a strong sense of community. National pastimes include ice hockey, maple festivals, and outdoor recreation.",
    Cities: "Major cities to live and work in include Toronto, Vancouver, and Montreal. Toronto is Canada’s economic engine, with thriving sectors in finance, technology, and media. Vancouver is celebrated for its natural beauty and is a hotspot for sustainable innovation and film production. Montreal blends European charm with North American opportunity and is a bilingual hub for arts, gaming, and aerospace.",
    Jobs: "Key industries in Canada include technology, energy, and healthcare. Toronto and Vancouver host growing tech sectors, while Alberta leads in oil and renewable energy. Healthcare and public services are in constant demand due to the country’s ageing population and strong social infrastructure. Additional opportunities exist in education, construction, logistics, and tourism.",
    VISA: "Canada offers various work permits through its Temporary Foreign Worker Program (TFWP) and International Mobility Program (IMP). Most foreign nationals require a job offer supported by a Labour Market Impact Assessment (LMIA). The Global Talent Stream allows fast-tracked visas for tech professionals. Canada also has pathways to permanent residence through the Express Entry system and Provincial Nominee Programs (PNPs).",
    Highlights: [
      { title: "Natural Beauty", description: "Canada is home to breathtaking landscapes such as Banff National Park, Niagara Falls, and the Northern Lights, offering countless outdoor experiences year-round." },
      { title: "Multicultural Society", description: "Canada celebrates diversity and immigration, with cities like Toronto and Vancouver being some of the most multicultural in the world." },
      { title: "Education and Healthcare", description: "Canada provides free public healthcare and access to world-class universities, making it attractive for families and young professionals alike." }
    ]
  },
    image_url: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcRCZs9tDtSpJP2hifq1WJJ4ABSV9BHB0JP_NjfbEGGkJKzQwTp-arDdFljbCZcEnxVBKt2qlXFzp3SKCiUKoVcHAnnvfSICEMkUsb8W1g",
    longitude: -106.3468,
    latitude: 56.1304
  },
  {
    name: "India",
    information: {
      About: "India is a vast and diverse country in South Asia, home to over 1.4 billion people. Known for its deep-rooted history, spiritual traditions, and rapid economic development, India offers a vibrant mix of modernity and heritage. With booming cities, thriving industries, and cultural richness, it is an increasingly popular destination for global professionals and travellers.",
      Culture: "Indian culture is a colourful mosaic of languages, religions, music, dance, and festivals. It is shaped by ancient philosophies, diverse ethnic groups, and a strong sense of family and community. From yoga and Ayurveda to Bollywood and Diwali, India’s traditions are deeply integrated into everyday life.",
      Cities: "Top cities for work and lifestyle include Delhi, Mumbai, and Bangalore. Delhi, the capital, is a historical and political centre with fast-developing infrastructure. Mumbai is India’s financial capital and the heart of the entertainment industry, offering dynamic job markets and nightlife. Bangalore is known as India’s Silicon Valley, home to major tech firms and startups, making it ideal for IT professionals.",
      Jobs: "Major industries include information technology, pharmaceuticals, textiles, finance, and education. Bangalore and Hyderabad lead in tech and software services, while Mumbai excels in finance, media, and trade. India also has a growing startup ecosystem and offers opportunities in healthcare, e-commerce, engineering, and agriculture.",
      VISA: "India offers an e-Visa facility for short visits related to tourism, business, or medical purposes. For work, foreign nationals need an Employment Visa, which requires a job offer from an Indian company, a minimum annual salary (currently around USD 25,000), and approval from the Indian Ministry of Home Affairs. Employment visas are typically issued for up to 1 year and are renewable.",
      Highlights: [
        { title: "Spiritual Heritage", description: "India is the birthplace of major world religions including Hinduism, Buddhism, Jainism, and Sikhism. Spiritual destinations like Varanasi, Rishikesh, and Bodh Gaya attract millions each year." },
        { title: "Tech and Innovation", description: "India has become a global leader in IT and software development, hosting innovation hubs, startups, and major R&D centres for global tech companies." },
        { title: "Cuisine and Festivals", description: "Indian cuisine is globally celebrated for its flavour and diversity. Festivals such as Holi, Eid, and Diwali showcase the country's festive spirit and unity in diversity." }
      ]
  },
    image_url: "https://lh3.googleusercontent.com/gps-cs-s/AC9h4np_CAY_mkgruVA5-bP_mch9E5wgYp_axowCxvEWwZOittCjzb0ycdpWXJ82-CbGaSyARzPGKBF8GqjMYkf4VF3OhYkbjAhgcpEx1-KEzzg9_9LZ4vT8ksg4NF2mDH6gTLR4g2E-=w1080-h624-n-k-no",
    longitude: 78.9629,
    latitude: 20.5937
  },
  {
    name: "Germany",
    information: {
      About: "Germany is a leading European nation known for its strong economy, world-class engineering, and rich cultural heritage. As a hub for innovation and international trade, Germany offers high living standards, robust public infrastructure, and ample job opportunities for professionals across multiple sectors.",
      Culture: "German culture emphasises efficiency, discipline, and intellectual achievement. The country has a long-standing tradition of excellence in music, philosophy, science, and engineering. Social life often includes local festivals, community events, and appreciation of the arts, especially classical music and contemporary design.",
      Cities: "Major cities to live and work in include Berlin, Munich, and Frankfurt. Berlin is the creative and political capital, known for its arts scene, history, and startup ecosystem. Munich is a centre for finance, automotive innovation, and clean living, often ranked among the world’s most liveable cities. Frankfurt is Germany’s banking and business capital, home to the European Central Bank and major corporations.",
      Jobs: "Germany's key industries include automotive manufacturing, engineering, finance, and IT. It is home to global automotive brands like BMW, Mercedes-Benz, and Volkswagen. The country also leads in industrial automation, green technology, and pharmaceuticals. Strong demand exists for skilled workers in healthcare, engineering, and digital sectors.",
      VISA: "Germany offers a variety of work visas for foreign nationals. The EU Blue Card is a popular pathway for highly qualified professionals, requiring a recognised university degree and a minimum salary threshold. Other routes include the Job Seeker Visa, which allows professionals to enter Germany for six months to find employment. All long-stay work visas require proof of qualifications and a job offer from a German employer.",
      Highlights: [
        { title: "Engineering Excellence", description: "Germany is renowned for its precision engineering, automotive innovation, and contributions to mechanical and electrical design." },
        { title: "Efficient Infrastructure", description: "Germany boasts an exceptional public transport network, including high-speed trains, trams, and clean, punctual services across cities and rural areas." },
        { title: "Festivals and Traditions", description: "Traditional celebrations such as Oktoberfest and Christmas markets reflect the rich regional culture, offering food, music, and community spirit." }
      ]
  },
    image_url: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcSVMTxXdNsIQm9oQ5JPPREFGXQ8ES-5nVfLw_vv9J-bZdMs6vHnZwBnFC8Cq82gI3lPuYIruh6tSsV1c-Fr3Xd0Uyq60ZhL8CPlr1Golw",
    longitude: 10.4515,
    latitude: 51.1657
  },
  {
    name: "Australia",
    information: {
      About: "Australia is a vast and diverse country known for its unique wildlife, high standard of living, and laid-back lifestyle. As both a continent and a nation, it offers a mix of vibrant urban centres, natural wonders, and multicultural communities, making it an attractive destination for travel, study, and skilled migration.",
      Culture: "Australian culture is relaxed, outdoorsy, and inclusive. It’s shaped by Indigenous traditions, British colonial history, and waves of immigration from Asia, Europe, and the Pacific. Barbecues, beach life, sport, and a strong sense of ‘mateship’ are central to daily life.",
      Cities: "Top cities to live and work in include Sydney, Melbourne, and Brisbane. Sydney is Australia’s financial and tech capital, famous for its harbour and global business presence. Melbourne is known for its arts, coffee culture, and education institutions. Brisbane, a growing city with a warm climate, offers opportunities in healthcare, construction, and tourism.",
      Jobs: "Australia’s economy is strong in mining, education, healthcare, construction, and information technology. The country’s abundant natural resources support a global mining sector, while world-class universities attract international students and academic professionals. Tech hubs are emerging in Sydney and Melbourne, and skilled tradespeople are in demand across construction and infrastructure.",
      VISA: "Australia offers multiple skilled migration pathways, including the Temporary Skill Shortage (TSS) visa and Skilled Independent visa (subclass 189). Applicants generally need to pass a points-based system based on age, skills, English proficiency, and occupation demand. Many pathways also allow permanent residency. Student visas and working holiday visas are also widely used by young professionals and travellers.",
      Highlights: [
        { title: "Natural Attractions", description: "From the Great Barrier Reef and Uluru to pristine beaches and national parks, Australia’s natural beauty is unmatched." },
        { title: "Work-Life Balance", description: "Australia ranks highly for quality of life, with a culture that values personal time, outdoor activities, and healthy living." },
        { title: "Multicultural Society", description: "Australia’s cities are home to people from over 200 countries, creating diverse food, languages, and cultural experiences." }
      ]
  },
    image_url: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcT-sVcZhh2HQhATZHOx0eAeJ3Q_q6THgxRZkqKupL2ltWDjof8Gsk_nKqyj-Z0Q9bNxwtElkVeJDRt1cPqElHteAo8Ask8Pg6cKF58uzA",
    longitude: 133.7751,
    latitude: -25.2744
  },
  {
    name: "Italy",
    information: {
      About: "Italy is a southern European country famed for its rich history, art, architecture, and world-class cuisine. From ancient Roman ruins to Renaissance masterpieces and charming coastal towns, Italy offers a deeply immersive cultural experience alongside modern economic opportunities, particularly in fashion, design, and tourism.",
      Culture: "Italian culture places great value on family, tradition, and artistic expression. Italy has made enduring contributions to art, music, science, and philosophy. The Italian way of life is characterised by a love for food, fashion, and meaningful social connections, with strong regional identities across the country.",
      Cities: "Top cities to live and work in include Rome, Milan, and Florence. Rome, the capital, is a centre of history, politics, and culture with thriving tourism and media industries. Milan is the financial and fashion capital of Italy, offering careers in design, luxury, and banking. Florence, steeped in Renaissance art, provides opportunities in education, arts, and heritage conservation.",
      Jobs: "Key industries in Italy include fashion, manufacturing, tourism, food and beverage, and automotive. Milan leads in luxury brands and creative design. Northern regions host strong industrial and engineering sectors, while hospitality and language-related roles are prominent in central and southern Italy. Agriculture and export industries are also vital parts of the economy.",
      VISA: "Non-EU nationals must apply for a work visa (nulla osta) through the Italian embassy or consulate in their home country. A job offer is typically required before applying, and the employer must get authorisation from Italian immigration authorities. Italy’s visa system includes various types such as the EU Blue Card, seasonal worker visas, and startup/self-employment permits.",
      Highlights: [
        { title: "Cultural Heritage", description: "Italy is home to more UNESCO World Heritage Sites than any other country, including iconic landmarks like the Colosseum, Vatican City, and Venice canals." },
        { title: "Food and Lifestyle", description: "Italian cuisine is known and loved worldwide. Regional dishes, fresh ingredients, and long communal meals are staples of daily life." },
        { title: "Fashion and Design", description: "As a global fashion capital, Italy hosts major events like Milan Fashion Week and is home to renowned brands such as Gucci, Prada, and Armani." }
      ]
  },
    image_url: "https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQxb7Gx_z_uyF9yger2ahCbt4upYJGM0D2BozCtTfPWUTU7EWSy7_wqJpgIwPETmihCed6l2auzxnVtIDZzgnPqn93jc4OnQm7hRSH4eQ",
    longitude: 12.5674,
    latitude: 41.8719
  },
  {
    name: "South Africa",
    information: {
      About: "South Africa is a vibrant and diverse country located at the southern tip of the African continent. Known for its stunning landscapes, multicultural society, and dynamic economy, it is a key destination for professionals and travellers alike. The country's complex history has shaped a unique blend of African, European, and Asian influences.",
      Culture: "South Africa is often referred to as the 'Rainbow Nation' due to its ethnic and cultural diversity. With 11 official languages and a mix of traditions, the culture reflects both resilience and celebration. Music, dance, and storytelling are integral parts of social life, alongside strong family and community bonds.",
      Cities: "Key cities to live and work in include Johannesburg, Cape Town, and Durban. Johannesburg is South Africa’s financial and commercial centre, offering opportunities in banking, technology, and media. Cape Town is a popular coastal city known for its tourism, design industry, and creative arts. Durban, with its warm climate and growing logistics sector, is a hub for trade and manufacturing along the Indian Ocean.",
      Jobs: "Major sectors in South Africa include mining, agriculture, tourism, energy, and financial services. Johannesburg hosts regional headquarters for many multinational companies, while Cape Town has a strong presence in tech startups and film production. There is also rising demand for skilled professionals in healthcare, engineering, and education.",
      VISA: "Foreign nationals seeking to work in South Africa must apply for a general work visa or critical skills visa. A job offer is typically required for general work visas, while the critical skills visa allows individuals in shortage occupations to apply without one. Applicants must meet qualifications, licensing, and verification requirements from the Department of Home Affairs. Work permits can lead to longer-term residence.",
      Highlights: [
        { title: "Natural Diversity", description: "From safaris in Kruger National Park to Table Mountain and the Garden Route, South Africa’s natural beauty spans savannahs, mountains, coastlines, and deserts." },
        { title: "Cultural Fusion", description: "South Africa’s culture blends African traditions with colonial heritage, seen in its cuisine, languages, festivals, and music genres like jazz, house, and kwaito." },
        { title: "Entrepreneurial Growth", description: "The country is home to one of Africa’s largest economies, with growing opportunities in fintech, renewable energy, and creative industries." }
      ]
  },
    image_url: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcSlgF2dXC-_gxqDDA0thQ1PVX669-lhsohZXSnQCqBWhOGF4wuRuG6_0nUtJOWbnCKYWNAFXlgTwp_rB6vNYCn_Ki_T3NCRgWADL_NoNA",
    longitude: 22.9375,
    latitude: -30.5595
  },
  {
    name: "United States",
    information: {
      About: "The United States is a vast and influential country in North America, known for its global leadership in politics, technology, culture, and economy. It spans a wide range of geographies and lifestyles, from bustling metropolises to serene natural parks, offering a dynamic and diverse environment for living and working.",
      Culture: "American culture is shaped by its immigrant roots and emphasises individualism, freedom, and innovation. With a blend of traditions from around the world, the U.S. is a cultural powerhouse in music, film, business, and technology. Celebrations like Thanksgiving and the Fourth of July reflect national pride and shared values.",
      cities: "Top cities to live and work in include New York, Los Angeles, and Chicago. New York City is the financial and cultural capital of the U.S., offering careers in finance, fashion, and media. Los Angeles is the centre of the entertainment industry, with opportunities in film, design, and technology. Chicago is known for its architecture, food scene, and strong industries in logistics, healthcare, and finance.",
      Jobs: "Major U.S. industries include technology, healthcare, finance, education, and entertainment. Silicon Valley leads the global tech sector, while cities like Boston and Houston are hubs for biotech and energy. The U.S. economy also supports a wide range of roles in research, entrepreneurship, engineering, law, and creative fields.",
      VISA: "Work visas for the U.S. include the H-1B visa for specialised workers, which requires employer sponsorship and is subject to an annual cap. Other options include the L-1 visa for intra-company transfers, O-1 for individuals with extraordinary ability, and TN for Canadian and Mexican professionals under NAFTA. Permanent residency (green card) routes exist through employment, family sponsorship, or investment.",
      Highlights: [
        { title: "Career Opportunities", description: "The U.S. is home to thousands of global companies and startups, offering a wide range of career paths in nearly every industry." },
        { title: "Cultural Influence", description: "American media, music, and technology have a strong global impact, with many trends and innovations originating from the U.S." },
        { title: "Natural Landscapes", description: "From national parks like Yellowstone and Yosemite to coastlines and deserts, the U.S. offers diverse outdoor experiences across its 50 states." }
      ]
  },
    image_url: "https://images.unsplash.com/photo-1499092346589-b9b6be3e94b2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG5ldyUyMHlvcmt8ZW58MHx8MHx8fDA%3D",
    longitude: -95.7129,
    latitude: 37.0902
  }
])
puts "Seeding COUNTRIES"

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
