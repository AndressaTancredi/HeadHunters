class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :skills
      t.decimal :salary
      t.datetime :application_deadline
      t.string :location

      t.timestamps
    end
  end
end
