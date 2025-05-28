class JobsController < ApplicationController
    def index
        @country = Country.find(params[:country_id])
        @jobs = Job.where(country_id: params[:country_id])
    end 

    def show
        @job = Job.find(params[:id])
    end
end
