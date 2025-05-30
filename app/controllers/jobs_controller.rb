class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    if params[:country_id].present?
      @country = Country.find(params[:country_id])
      @jobs = Job.where(country_id: params[:country_id])
    else
      @jobs = Job.all
    end


    # The `geocoded` scope filters only flats with coordinates
    @markers = @jobs.geocoded.map do |job|
      {
        lat: job.latitude,
        lng: job.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {job: job})
      }
    end
  end

  def show
    @job = Job.find(params[:id])
    @job_application = JobApplication.new
    
  end
end
