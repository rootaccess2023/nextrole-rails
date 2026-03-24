class CreateApplicationEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :application_events do |t|
      t.references :job_application, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :event_type
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day
      t.string :location
      t.string :meeting_url
      t.text :notes
      t.string :status
      t.integer :reminder_minutes_before

      t.timestamps
    end
  end
end
