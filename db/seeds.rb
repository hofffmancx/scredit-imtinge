# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ---新增admin种子档---

if User.find_by(email: "admin@123.com").nil?
  u = User.new
  u.email = "admin@123.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


# Initialize Product
#
# Product.create!(title: "美国移民概况",
#   description: "<p>申请周期短，无学历、语言和商业背景要求；</p>
#   <p>无需创业，无需亲自管理企业；</p>
#   <p>一人申请全家移民，可自由出入美国，无移民监；</p>
#   <p>持绿卡五年后，可申请美国国籍，免签出入160多个国家；</p>
#   <p>子女免费接受12年义务高素质教育，轻松进入世界一流高等学府。</p>",
#   price: 59,
#   quantity: 50,
#   category: "美国移民",
#   yieldly: "中国",
#   particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#   )
#
# Product.create!(title: "希腊移民概况",
#   description: "<p>投资额最低：仅需25万欧元购房，一步到位获得绿卡；</p>
#   <p>门槛低：无需解释商业背景及资金来源，无学历和语言要求；</p>
#   <p>收益稳定：购买房产获得永久产权，出租收益稳定；</p>
#   <p>审理快：2个月即可获签；</p>
#   <p>惠及三代：申请人及配偶的父母可随同申请，一人投资三代移民；</p>",
#   price: 59,
#   quantity: 50,
#   category: "欧洲移民",
#   yieldly: "中国",
#   particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#   )
# #
# Product.create!(title: "西班牙移民概况",
#    description: "<p>气候宜人、生活成本低、高质量生活品质，适宜人类居住；</p>
#    <p>西班牙护照，可享受高达160多个国家免签或落地签；</p>
#    <p>高福利的欧盟体系；</p>
#    <p>投资50万欧元，抄底吸纳极具投资价值的房产，即可申请居留；</p>
#    <p>房产属永久产权，可时代相传；</p>",
#    price: 59,
#    quantity: 50,
#    category: "欧洲移民",
#    yieldly: "中国",
#    particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#    )
#
# Product.create!(title: "葡萄牙移民",
#  description: "<p>置地移民，保值、稳定、无风险；</p>
#  <p>不需提供资产证明，无需解释资金来源；</p>
#  <p>审理速度快，最快2周后可以拿到居留；</p>
#  <p>可在葡萄牙合法工作或开公司置业；</p>
#  <p>整个家庭可以同时申请移民；</p>",
#  price: 59,
#  quantity: 50,
#  category: "欧洲移民",
#  yieldly: "中国",
#  particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#  )
#
# Product.create!(title: "塞浦路斯移民",
#  description: "<p>投资额最低：仅需25万欧元购房，一步到位获得绿卡；</p>
#  <p>门槛低：无需解释商业背景及资金来源，无学历和语言要求；</p>
#  <p>收益稳定：购买房产获得永久产权，出租收益稳定；</p>
#  <p>审理快：2个月即可获签；</p>
#  <p>惠及三代：申请人及配偶的父母可随同申请，一人投资三代移民；</p>",
#  price: 59,
#  quantity: 50,
#  category: "欧洲移民",
#  yieldly: "中国",
#  particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#  )
#
# Product.create!(title: "加拿大",
#  description: "<p>无投资风险：魁北克政府担保、资金投向指定基金账号；</p>
# <p>无经营风险：无须经营管理，申请人不需要做商业计划、无需管理项目；</p>
# <p>无居住地的限制，可在加国任何地方居住；</p>
# <p>无语言要求：该项目对申请人无学历及英语和法语水平的要求；</p>
# <p>签证一步到位：一步到位，直接获得枫叶卡。</p>",
#  price: 59,
#  quantity: 50,
#  category: "其他国家",
#  yieldly: "中国",
#  particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#  )
#
# Product.create!(title: "澳大利亚",
#  description: "<p>没有年龄限制，没有英语要求，不需打分；</p>
# <p>资金来源证明宽松，汇款要求宽松；</p>
# <p>投资500万澳元到规定的投资产品；</p>
# <p>4年中，主申请人累计在澳洲住满160天；</p>
# <p>要有州政府担保，取得EOI邀请</p>",
#  price: 59,
#  quantity: 50,
#  category: "其他国家",
#  yieldly: "中国",
#  particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#  )

# Product.create!(title: "圣基茨",
#   description: "<p>世界上最早开设护照项目的国家；</p>
# <p>审理速度快，6-10个月即可直接取得护照；</p>
# <p>承认双重国籍，可保留内地身份；</p>
# <p>无移民监，没有居住要求，不影响在国内的正常生活与工作；</p>
# <p>门槛低，无资金来源及经商经验的要求；</p>",
#   price: 59,
#   quantity: 50,
#   category: "护照国家",
#   yieldly: "中国",
#   particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#   )



  Banner.create!(
    name: "轮播图片1",
    title: "请到后台修改"
  )

  Banner.create!(
    name: "轮播图片2",
    title: "请到后台修改"
  )

  Banner.create!(
    name: "轮播图片3",
    title: "请到后台修改"
  )

#种子样例
# Product.create!(title: "小型琴叶榕",
#    description: "高度约60cm（含盆）",
#    price: 59,
#    quantity: 50,
#    category: "装饰品",
#    yieldly: "中国",
#    particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
#    )
#
# Product.create!(title: "艺术版画",
#    description: "规格：60cm*60cm",
#    price: 499,
#    quantity: 10,
#    category: "装饰品",
#    yieldly: "中国",
#    particulars: "作品充满诗意优雅的氛围，色彩丰富而自然<br>非常适合在卧室、客厅、书房悬挂<br><br>应用场景<br><img alt=\"\" src=\"http://ww4.sinaimg.cn/large/006tNbRwgy1fftvuqz9rrj30hr0hn0ua.jpg\">",
#    )
