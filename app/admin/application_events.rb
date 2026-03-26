ActiveAdmin.register ApplicationEvent do
  permit_params :job_application_id, :user_id, :title, :event_type, :starts_at, :ends_at,
                :all_day, :location, :meeting_url, :notes, :status, :reminder_minutes_before

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
    column :title
    column :event_type
    column :job_application
    column :user
    column :starts_at
    column :ends_at
    column :status
    actions
  end
end
