class Applicant < ApplicationRecord
  has_one_attached :avatar
  belongs_to :applicantuser

  def thumbnail
    return self.avatar.variant(resize: '250x250!').processed
  end
end
