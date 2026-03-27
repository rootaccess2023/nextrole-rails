ActiveAdmin.register User do
  permit_params :email,
                :first_name,
                :last_name,
                :target_role,
                :target_location,
                :employment_type,
                :weekly_goal,
                :follow_up_days,
                :phone,
                :linkedin_url,
                :portfolio_url,
                :last_active_at,
                :onboarding_completed_at

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :created_at
end