class Applicant < ApplicationRecord
  validates :name, :social_name, :birthdate, :education, :description, :location, :avatar, presence: true

  has_one_attached :avatar
  belongs_to :applicantuser

  accepts_nested_attributes_for(allow_destroy: true)

  def thumbnail
    return self.avatar.variant(resize: '250x250!').processed
  end
end
