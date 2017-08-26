class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:join, :quit]
  before_action :validate_search_key, only: [:search]


  # --CRUD--
  def index

    @country_categories = CountryCategory.all

    if params[:category].blank?
        @products = Product.order("created_at DESC")

    else
         @country_category_id = CountryCategory.find_by(title: params[:category]).id
         @products = Product.where(:country_category_id => @country_category_id)

    end
  end


  def show
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product.id).order("created_at DESC")
    @review = Review.new
    @projects = @product.projects
    @stories = Story.where(:product_id => @product.id)
    
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 ''#{@product.title}'' 加入购物车"
    else
      flash[:warning] = "你的购物车已有此商品"
    end
    redirect_to :back
  end




  # ---collection 收藏商品---

  def join
    @product = Product.find(params[:id])

    if !current_user.is_member_of?(@product)
      current_user.join_collection!(@product)
    end

    redirect_to product_path(@product)
    flash[:notice] = "你已将 ''#{@product.title}'' 加入收藏"
  end

  def quit
    @product = Product.find(params[:id])

    if current_user.is_member_of?(@product)
      current_user.quit_collection!(@product)
    end

    redirect_to product_path(@product)
    flash[:notice] = "你已将 ''#{@product.title}'' 移除收藏"
  end


  # --search 商品搜索--

  def search
    if @query_string.present?
      @products = search_params
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  end

  private

  def search_params
    Product.ransack({:title_or_description_or_particulars_cont => @query_string}).result(distinct: true)
  end

  def product_params
    params.require(:product).permit(:image, :title, :description,:country_category_id)
  end


end
