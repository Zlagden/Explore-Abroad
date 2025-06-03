class Job < ApplicationRecord
  belongs_to :country
  geocoded_by :location
  after_validation :geocode, if:
  :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_jobs,
  against: [
    [:job_title, 'A'], 
    [:company_name, 'B'],
    [:location, 'C'], 
    [:description, 'D'],
  ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

end
