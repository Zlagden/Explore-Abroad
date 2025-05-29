class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @jobs = Job.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @jobs.geocoded.map do |job|
      {
        lat: job.latitude,
        lng: job.longitude
        info_window_html: render_to_string(partial: "info_window", locals: {job: job})
      }

    end
  end

  def show
    @job = Job.find(params[:id])
  end
end
