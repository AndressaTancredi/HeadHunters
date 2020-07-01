class AddApplicantuserToApplicant < ActiveRecord::Migration[6.0]
  def change
    add_reference :applicants, :applicantuser, null: false, foreign_key: true
  end
end
