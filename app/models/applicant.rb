class Applicant < ApplicationRecord
  has_one_attached :avatar
  belongs_to :applicantuser
end
