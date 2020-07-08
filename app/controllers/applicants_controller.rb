class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update]

  def index
    @applicants = Applicant.all
  end
  
  def profile
    @profile = current_applicantuser
  end

  def show    
    @applicant = Applicant.find(params[:id])
  end

  def new
    @applicant = Applicant.new    
  end

  def create
    @applicant = current_applicantuser.build_applicant(applicant_params)

    if @applicant.save
      redirect_to @applicant
    else
      render :new      
    end
  end

  def edit
  end

  def update
    if @applicant.update(applicant_params)
      redirect_to @applicant
    else
      render 'edit'
    end  
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:name, :social_name, :birthdate, :education, :description, :location, :avatar)
  end

end