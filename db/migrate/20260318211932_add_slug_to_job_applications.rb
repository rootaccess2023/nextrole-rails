class AddSlugToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :slug, :string

    reversible do |dir|
      dir.up do
        JobApplication.reset_column_information
        JobApplication.find_each do |ja|
          ja.update_column(:slug, SecureRandom.alphanumeric(8))
        end
      end
    end

    change_column_null :job_applications, :slug, false
    add_index :job_applications, :slug, unique: true
  end
end
