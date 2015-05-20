json.total_pages @search_results.total_pages

json.search_results @search_results do |search_result|
  if search_result.is_a? Recipe
    json.partial! "api/recipes/recipe_search_result", recipe: search_result
  else
    json.partial! "api/users/user_search_result", user: search_result
  end
end
