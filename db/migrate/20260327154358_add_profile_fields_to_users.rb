class AddProfileFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :target_role, :string
    add_column :users, :target_location, :string
    add_column :users, :employment_type, :string
    add_column :users, :follow_up_days, :integer, default: 7
    add_column :users, :phone, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :portfolio_url, :string
  end
end
