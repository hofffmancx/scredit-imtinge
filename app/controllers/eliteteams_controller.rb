class EliteteamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  layout "account", only: [:new]


  # ---CRUD---

  def index
    @eliteteams = Eliteteam.order("created_at DESC")


  end




  # ---private---

  private

  def eliteteam_params
    params.require(:eliteteam).permit(:description)
  end
end
