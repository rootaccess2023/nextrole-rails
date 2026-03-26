class AddSlugToApplicationEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :application_events, :slug, :string
  end
end
