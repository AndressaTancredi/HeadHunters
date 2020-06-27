class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show]

  def index
    @applicants = Applicant.all
  end

  def show    
  end

  def new
    @applicant = Applicant.new    
  end

  def create
    @applicant = Applicant.new(applicant_params)

    if @applicant.save
      redirect_to @applicant
    else
      render :new      
    end
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:name, :social_name, :birthdate, :education, :description, :location)
  end

end