class AddProfileToApplicant < ActiveRecord::Migration[6.0]
  def change
    add_column :applicants, :social_name, :string
    add_column :applicants, :birthdate, :datetime
    add_column :applicants, :education, :string
    add_column :applicants, :description, :string
    add_column :applicants, :location, :string
    add_column :applicants, :image, :string
  end
end
