module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :authenticate_user!

      # GET /api/v1/user
      def user
        render json: {
          user: {
            id:                       current_user.id,
            email:                    current_user.email,
            created_at:               current_user.created_at,

            # Phase 1 additions
            weekly_goal:              current_user.weekly_goal,
            last_active_at:           current_user.last_active_at,
            onboarding_completed_at:  current_user.onboarding_completed_at,

            # Derived — drives Home screen states without extra API calls
            days_since_active:        days_since_active,
            onboarding_completed:     current_user.onboarding_completed_at.present?,
            onboarding_steps:         onboarding_steps
          }
        }, status: :ok
      end

      # PATCH /api/v1/user
      def update
        if current_user.update(user_params)
          render json: { user: serialize_user }, status: :ok
        else
          render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/user
      def destroy
        current_user.destroy!
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(
          :first_name,
          :target_role,
          :weekly_goal,
        )
      end

      def serialize_user
        {
          id:                      current_user.id,
          email:                   current_user.email,
          created_at:              current_user.created_at,
          weekly_goal:             current_user.weekly_goal,
          last_active_at:          current_user.last_active_at,
          onboarding_completed_at: current_user.onboarding_completed_at,
          onboarding_completed:    current_user.onboarding_completed_at.present?,
          onboarding_steps:        onboarding_steps
        }
      end

      def days_since_active
        return 0 if current_user.last_active_at.nil?
        ((Time.current - current_user.last_active_at) / 1.day).floor
      end

      def onboarding_steps
        [
          {
            key:       "add_first_application",
            label:     "Add your first application",
            completed: current_user.job_applications.exists?
          },
          {
            key:       "set_weekly_goal",
            label:     "Set a weekly goal",
            completed: current_user.weekly_goal.present?
          },
          {
            key:       "complete_onboarding",
            label:     "Complete your profile",
            completed: current_user.onboarding_completed_at.present?
          }
        ]
      end
    end
  end
end