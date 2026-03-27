class Api::V1::JobApplicationsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_job_application, only: [:show, :update, :destroy]
  before_action :update_last_active

  def index
    job_applications = current_user.job_applications.order(created_at: :desc)
    render json: { job_applications: job_applications }, status: :ok
  end

  def show
    render json: {
      job_application: @job_application,
      events: @job_application.application_events.order(created_at: :asc)
    }, status: :ok
  end

  def create
    job_application = current_user.job_applications.new(job_application_params)

    if job_application.save
      render json: { job_application: job_application }, status: :created
    else
      render json: { errors: job_application.errors.full_messages }, status: :unprocessable_content
    end
  end

  def update
    if @job_application.update(job_application_params)
      render json: { job_application: @job_application }, status: :ok
    else
      render json: { errors: @job_application.errors.full_messages }, status: :unprocessable_content
    end
  end

  def destroy
    @job_application.destroy
    head :no_content
  end

  private

  def set_job_application
    @job_application = current_user.job_applications.find_by!(slug: params[:slug])
  end

  def job_application_params
    params.require(:job_application).permit(
      :company,
      :job_title,
      :job_url,
      :location,
      :source,
      :stage,
      :notes,
      :employment_type,
      :job_description,
      :contact_name,
      :contact_email,
      :contact_linkedin_url,
      :last_contacted_at,
      :application_deadline,
      :archived_at,
      :closed_reason
    )
  end

  # Update the last active at timestamp for the user
  def update_last_active
    return unless current_user
    if current_user.last_active_at.nil? || current_user.last_active_at < 1.hour.ago
      current_user.update_column(:last_active_at, Time.current)
    end
  end
end