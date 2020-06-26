class AddNameToApplicant < ActiveRecord::Migration[6.0]
  def change
    add_column :applicants, :name, :string
  end
end
