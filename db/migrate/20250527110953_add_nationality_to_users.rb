class AddNationalityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nationality, :string, null: false
    add_column :users, :date_of_birth, :date, null: false
  end
end
