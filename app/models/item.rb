class Item < ApplicationRecord
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
    #ここの内容を聞く
     0, #
     1, #
     2, #
     3, #
     4 #
  }

  enum shipping_costs:{
    #送料
  }

  enum shipping_form:{
  }

  enum shipping_date:{
  }

end
