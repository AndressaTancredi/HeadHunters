class JobsController < ApplicationController
  before_action :set_job, only: [:show]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      render :new #O render, ao contrário do redirect, só chama a mesma view nao perdendo o que o user já escreveu.
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :skills, :salary, :application_deadline, :location, :level)
  end

  def set_job
    @job = Job.find(params[:id])
  end  
end