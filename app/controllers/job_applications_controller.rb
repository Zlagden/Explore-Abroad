class JobApplicationsController < ApplicationController
  def create
    @job_application = JobApplication.new(job_app_params)
    @job = Job.find(params[:job_id])
    @job_application.job = @job
    @job_application.user = current_user

    if @job_application.save
      redirect_to my_applications_job_applications_path
    else
      render "jobs/show", status: :unprocessable_entity
    end
  end

  def my_applications
    @job_applications = current_user.job_applications
  end

  def my_journeys
    @job_applications = current_user.job_applications
    @markers = @job_applications.map do |job_application|
      {
        lat: job_application.job.latitude,
        lng: job_application.job.longitude
      }
    end
  end

  private

  def job_app_params
    params.require(:job_application).permit(:cv, :cover_letter)
  end
end
