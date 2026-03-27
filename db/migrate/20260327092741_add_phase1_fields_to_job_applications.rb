class AddPhase1FieldsToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :contact_name, :string
    add_column :job_applications, :contact_email, :string
    add_column :job_applications, :contact_linkedin_url, :string
    add_column :job_applications, :last_contacted_at, :datetime
    add_column :job_applications, :application_deadline, :datetime
    add_column :job_applications, :archived_at, :datetime
    add_column :job_applications, :closed_reason, :string
  end
end