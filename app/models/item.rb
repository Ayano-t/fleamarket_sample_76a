class Item < ApplicationRecord

  belongs_to :user, foreign_key: :seller_id
  belongs_to :category, foreign_key: :category_id

  has_many :images, dependent: :destroy
  validates :images, presence: true

  belongs_to :large_category,class_name:"Category",optional: true,foreign_key: "large_category_id"
  belongs_to :middle_category,class_name:"Category",optional: true,foreign_key: "middle_category_id"
  belongs_to :small_category,class_name:"Category",optional: true,foreign_key: "small_category_id"


  enum condition: ["新品・未使用", "数回使用したが美品", "使用感はあるが良い状態", "使用感や傷あり"]

  enum status: ["未発送", "発送済み"]

  enum shipping_costs: ["送料込", "送料別"]

  enum shipping_form: ["ネコポス", "コンパクト宅急便", "宅急便"]

  enum shipping_date: ["即日", "１〜２日後", "３〜４日後", "１週間後"]

end
