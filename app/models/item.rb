class Item < ApplicationRecord

  belongs_to :user, foreign_key: :seller_id
  belongs_to :category, foreign_key: :category_id

  has_many :images, dependent: :destroy
  validates :images, presence: true

  belongs_to :large_category,class_name:"Category",optional: true,foreign_key: "large_category_id"
  belongs_to :middle_category,class_name:"Category",optional: true,foreign_key: "middle_category_id"
  belongs_to :small_category,class_name:"Category",optional: true,foreign_key: "small_category_id"


  enum condition: { new: 0, very_good: 1, good: 2, average: 3, poor: 4 }

  enum status: ["未発送", "発送済み"]

  enum shipping_costs: ["送料込", "送料別"]

  enum shipping_form: ["ネコポス", "コンパクト宅急便", "宅急便"]

  enum shipping_date: ["即日", "１〜２日後", "３〜４日後", "１週間後"]

end
