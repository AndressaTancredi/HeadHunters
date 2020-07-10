class Job < ApplicationRecord
  validates :title, presence: true

  belongs_to :headhunteruser

  accepts_nested_attributes_for(allow_destroy: true)

  def closed_for_application
    return if Job.application_deadline == Date.today
  end
end
