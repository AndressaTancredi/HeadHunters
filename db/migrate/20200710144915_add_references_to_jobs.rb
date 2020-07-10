class AddReferencesToJobs < ActiveRecord::Migration[6.0]
  def change
    add_reference :jobs, :headhunteruser, null: false, foreign_key: true
  end
end
