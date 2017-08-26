class CompanyculturesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  layout "account", only: [:new]


  # ---CRUD---

  def index
    @companycultures = Companyculture.order("created_at DESC")


  end




  # ---private---

  private

  def companyculture_params
    params.require(:companyculture).permit(:description)
  end
end
