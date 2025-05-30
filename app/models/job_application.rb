class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job

  # validates :cv, presence: true
  # validates :cover_letter, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending accepted declined] }
end
