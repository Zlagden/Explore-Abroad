class JobApplicationsController < ApplicationController

    def create
        @job_application = JobApplication.new(job_app_params)
        @job = Job.find(params[:job_id])
        @job_application.job = @job
        @job_application.user = current_user


        if @job_application.save
            redirect_to countries_path
        else
            render "jobs/show", status: :unprocessable_entity
        end
    end

    private 

    def job_app_params
        params.require(:job_application).permit(:cv, :cover_letter)
    end
end
