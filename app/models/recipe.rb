# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  author_id    :integer          not null
#  title        :string           not null
#  instructions :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  primary_tag  :string           not null
#  servings     :integer
#

class Recipe < ActiveRecord::Base
  validates :author_id, :title, :instructions, :servings, :primary_tag, presence: true
  validates :servings, numericality: true

  belongs_to :author, class_name: "User"

  has_many :recipes_ingredients,
            class_name: "RecipesIngredient",
            foreign_key: :recipe_id,
            inverse_of: :recipe,
            dependent: :destroy

  has_many :ingredients, through: :recipes_ingredients, source: :ingredient
  has_many :menus_recipes, class_name: "MenusRecipe"
  has_many :menus, through: :menus_recipes, source: :menu
  has_many :annotations, as: :annotatable, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  scope :primary_tag, -> (tag) { where primary_tag: tag }
  scope :author_id, -> (id) { where author_id: id }

  TAGS = %w(appetizer entree side sandwich soup salad drink cake cookie pie)

end
