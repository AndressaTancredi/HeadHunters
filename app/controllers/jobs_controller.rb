class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_headhunteruser.job.build(job_params)

    if @job.save
      redirect_to @job
    else
      render :new #O render, ao contrário do redirect, só chama a mesma view nao perdendo o que o user já escreveu.
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job.delete
    redirect_to jobs_path
  end

  def search
    @jobs = Job.where("title LIKE ?", "%#{params[:query]}%")
    @search_query = params[:query]
    render :index
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :skills, :salary, :application_deadline, :location, :level)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
