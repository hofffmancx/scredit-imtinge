class CompanyhonorsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  layout "account", only: [:new]


  # ---CRUD---

  def index
    @companyhonors = Companyhonor.order("created_at DESC")

        
  end




  # ---private---

  private

  def companyhonor_params
    params.require(:companyhonor).permit(:description)
  end
end
