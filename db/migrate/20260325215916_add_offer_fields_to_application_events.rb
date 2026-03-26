class AddOfferFieldsToApplicationEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :application_events, :salary_min, :integer
    add_column :application_events, :salary_max, :integer
    add_column :application_events, :salary_currency, :string
    add_column :application_events, :salary_period, :string
    add_column :application_events, :bonus, :integer
    add_column :application_events, :equity, :string
    add_column :application_events, :offer_expires_at, :datetime
    add_column :application_events, :offer_status, :string, default: 'pending'
    add_column :application_events, :employment_type, :string
  end
end
