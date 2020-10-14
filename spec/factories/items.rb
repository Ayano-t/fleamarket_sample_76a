FactoryBot.define do
  
  factory :item do
    name           {"MacBook Pro"}
    description    {"1世代前のものです。新しいものを購入したので出品します。"}
    brand          {"Apple"}
    condition      {1}   
    status         {1}   
    shipping_costs {1}   
    shipping_from  {1}   
    shipping_date  {1}   
    price          {10000}
    images {[build(:image)]}
    
    after(:build) do |item|
      parent_category = create(:category)
      child_category = parent_category.children.create(name: "child")
      grand_child_category = child_category.children.create(name: "grandchild")

      item.category_id = grand_child_category.id
    end
    
  end

end