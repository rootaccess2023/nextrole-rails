class AddJobDetailsToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :employment_type, :string
    add_column :job_applications, :job_description, :text
  end
end
