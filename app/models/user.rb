class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :reviews, dependent: :destroy              #商品留言关系，dependent: :destroy表述联级删除
  has_many :article_reviews, dependent: :destroy      #文章留言关系
  has_many :activity_reviews, dependent: :destroy      #热门活动留言关系

  has_many :project  #国家下具体的项目

  # ---收藏商品功能三方关系代码块---

  has_many :collections                               #收藏商品关系
  has_many :participated_products, through: :collections, source: :product

  def is_member_of?(product)
    participated_products.include?(product)
  end

  def join_collection!(product)
    participated_products << product
  end

  def quit_collection!(product)
    participated_products.delete(product)
  end


  # ---收藏文章功能三方关系代码块---

  has_many :article_collections                               #收藏商品关系
  has_many :participated_articles, through: :article_collections, source: :article

  def is_article_member_of?(article)
    participated_articles.include?(article)
  end

  def join_article_collection!(article)
    participated_articles << article
  end

  def quit_article_collection!(article)
    participated_articles.delete(article)
  end

  # ---收藏热门活动功能三方关系代码块---

  has_many :activity_collections                               #收藏商品关系
  has_many :participated_activities, through: :activity_collections, source: :activity

  def is_activity_member_of?(activity)
    participated_activities.include?(activity)
  end

  def join_activity_collection!(activity)
    participated_activities << activity
  end

  def quit_activity_collection!(activity)
    participated_activities.delete(activity)
  end





  # ---与order订单关系---

  has_many :orders
  has_many :course_orders


  # ---与article订单关系---

  has_many :articles

  # ---与activity订单关系---

  has_many :activities

  





  # ---is_admin判断式---

  def admin?
    is_admin
  end


  # ---判断是否设置了用户名---

  def display_name
    if self.username.present?
      self.username
    else
      self.email.split("@").first           #把“@”两头的内容分开，做出数组
    end
  end


  # ---添加头像---

  mount_uploader :avatar, ImageUploader


end
