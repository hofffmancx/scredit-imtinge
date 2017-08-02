class ProjectsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @project = Project.new
  end



  def show
     @product = Product.find(params[:product_id])
     @project = Project.find(params[:id])

     @stories = Story.where(:product_id=>@product.id)
     if @stories.blank?
       @stories = Story.all.order("created_at DESC").limit(5)
     end

     if Product.count <10
       @products = Product.all.order("created_at DESC")
     else
       @products = Product.all.order("created_at DESC").limit(10)
     end



     if Activity.count <10
       @activities = Activity.all.order("created_at DESC")
     else
       @activities = Activity.all.order("created_at DESC").limit(10)
     end


     if Article.count <10
       @articles = Article.all.order("created_at DESC")
     else
       @articles = Article.all.order("created_at DESC").limit(10)
     end


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

  def edit
    @product = Product.find(params[:product_id])  # 通过project数据表里的product_id,找到product的ID。也就是先找到爹是谁。 project.product_id == product.id
    @project = Project.find(params[:id]) # 把新建的数据的content传给实体变量@project
  end

  def update
    @product = Product.find(params[:product_id])
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to admin_products_path,notice: "项目编辑成功！"
    else
      render :edit
    end
  end


  private

  def project_params
    params.require(:project).permit(:title, :content,:details,:image,:advantage,:observe,:apply)
  end
end
