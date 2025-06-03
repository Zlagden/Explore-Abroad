class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    if params[:country_id].present?
      @country = Country.find(params[:country_id])
      @jobs = Job.where(country_id: params[:country_id])
    else
      @jobs = Job.all
    end

    if params[:query].present?
      @jobs = @jobs.search_by_jobs(params[:query])
    end

    if params[:salary].present?
      @jobs = @jobs.where("description->>'Salary' > ? AND description->>'Salary' < ? ", "#{params[:salary].split("-").first}", "#{params[:salary].split("-").last}")
    end

    if [:employment_type, :seniority, :position, :field, :location].any? { |key| params[key].present? }
      @jobs = @jobs.where("description->>'Employment_Type' = ? OR description->>'Seniority' = ? OR description->>'Postion' = ? OR description->>'Field' = ? ", "#{params[:employment_type]}", "#{params[:seniority]}", "#{params[:position]}", "#{params[:field]}")
    end

  




    # if params[:employment_type].present?
    #   @jobs = @jobs.where("description->>'Employment_Type' = ? ", "#{params[:employment_type]}")
    # end

    # if params[:seniority].present?
    #   @jobs = @jobs.where("description->>'Seniority' = ? ", "#{params[:seniority]}")
    # end

    # if params[:position].present?
    #   @jobs = @jobs.where("description->>'Postion' = ? ", "#{params[:position]}")
    # end

    # if params[:field].present?
    #   @jobs = @jobs.where("description->>'Field' = ? ", "#{params[:field]}")
    # end

    # if params[:location].present?
    #   @jobs = @jobs.where("'Location' = ? ", "#{params[:field]}")
    # end
    #raise
  
    

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
