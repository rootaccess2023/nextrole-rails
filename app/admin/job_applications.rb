ActiveAdmin.register JobApplication do
  permit_params :user_id, :company, :job_title, :job_url, :location, :source, :stage, :notes

  # URLs use Sluggable#to_param (slug); default ActiveAdmin still calls Model.find(id).
  controller do
    def find_resource
      id = params[:id].to_s
      if id.match?(/\A\d+\z/)
        scoped_collection.find(id)
      else
        scoped_collection.find_by!(slug: id)
      end
    end
  end

  index do
    selectable_column
    id_column
    column :company
    column :job_title
    column :job_url
    column :location
    column :source
    column :stage
    column :notes
    actions
  end
end