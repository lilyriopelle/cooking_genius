class Api::MenusController

  def show
  end

  def create
  end

  private
    def menu_params
      params.require(:menu).permit(:title, :author_id)
    end

end
