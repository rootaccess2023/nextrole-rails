class AddPhase1FieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :weekly_goal, :integer, default: 3
    add_column :users, :last_active_at, :datetime
    add_column :users, :onboarding_completed_at, :datetime
  end
end
