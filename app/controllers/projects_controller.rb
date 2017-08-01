class ProjectsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @project = Project.new
  end



   def show
     @product = Product.find(params[:product_id])
     @project = Project.find(params[:id])
   end

  def create
    @product = Product.find(params[:product_id])  # 通过project数据表里的product_id,找到product的ID。也就是先找到爹是谁。 project.product_id == product.id
    @project = Project.new(project_params) # 把新建的数据的content传给实体变量@project
    @project.product = @product # 从def create 第一行里拿到的@product, 把它的值赋给@project的product。
    @project.user = current_user

    if @project.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :content)
  end
end
