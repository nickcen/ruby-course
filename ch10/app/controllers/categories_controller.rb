class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.where(is_del: false)

    render json: @categories, include: '**'
  end
end
