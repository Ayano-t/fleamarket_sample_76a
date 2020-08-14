class Item < ApplicationRecord

  belongs_to :user, foreign_key: :seller_id
  belongs_to :category, foreign_key: :category_id

  has_many :images, dependent: :destroy
  validates :images, presence: true

  belongs_to :large_category,class_name:"Category",optional: true,foreign_key: "large_category_id"
  belongs_to :middle_category,class_name:"Category",optional: true,foreign_key: "middle_category_id"
  belongs_to :small_category,class_name:"Category",optional: true,foreign_key: "small_category_id"


  enum condition:{
    new: 0, #新品未使用
    very_good: 1, #新品に近い状態
    good: 2, #使用感はあるが良い状態
    average: 3, #やや使用感がある
    poor: 4 #特筆すべき傷などあり
  }

  enum status:{
    #ステータスとは
     0, #
     1, #
     2, #
     3, #
     4 #
  }

  enum shipping_costs:{
    #送料
    included: 0, #送料込み
    excluded: 1　 #送料別
  }

  enum shipping_form:{
    #出荷形態
  }

  enum shipping_date:{
    #出荷日
  }

end
