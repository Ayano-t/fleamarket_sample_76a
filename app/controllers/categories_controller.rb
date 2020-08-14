class CategoriesController < ApplicationController
  before_action :set_categories, only: [:show]

  private

  def set_categories
    @large_category = Largecategory.all
    @middle_category = Middlecategory.all
    @small_category = Smallcategory.all
  end


end
