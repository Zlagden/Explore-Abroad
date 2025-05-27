class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :company_name, null: false
      t.text :description
      t.text :requirements
      t.string :location
      t.string :job_title
      t.references :country, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
