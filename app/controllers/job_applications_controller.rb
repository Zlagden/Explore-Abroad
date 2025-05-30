class JobApplicationsController < ApplicationController
  def my_applications
    @job_applications = current_user.job_applications

  end
end
