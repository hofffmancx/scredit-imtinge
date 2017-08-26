class CompanyprofilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :join, :quit]
  layout "account", only: [:new]


  # ---CRUD---

  def index
    @companyprofiles = Companyprofile.order("created_at DESC")

        if Companyprofile.count <10
          @companyprofiles = Companyprofile.all.order("created_at DESC")
        else
          @companyprofiles = Companyprofile.all.order("created_at DESC").limit(10)
        end
  end

  def show
    @companyprofile = Companyprofile.find(params[:id])
    @user = @companyprofile.user


    if Companyprofile.count <3
      @companyprofiles = Companyprofile.order("created_at DESC")
    else
      @companyprofiles = Companyprofile.order("created_at DESC").limit(3)
    end




    if Companyprofile.count <10
      @companyprofiles = Companyprofile.all.order("created_at DESC")
    else
      @companyprofiles = Companyprofile.all.order("created_at DESC").limit(10)
    end







  end

  def new
    @companyprofile = Companyprofile.new
  end

  def create
    @companyprofile = Companyprofile.new(companyprofile_params)
    @companyprofile.user = current_user

    if @acompanyprofile.save

      flash[:notice] = "文章已提交，待管理员审核后可发布"
    else
      render :new
    end
  end




  # ---private---

  private

  def companyprofile_params
    params.require(:companyprofile).permit( :title, :description, :user_id)
  end
end
