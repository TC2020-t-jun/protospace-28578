class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all.order(id: "DESC")
  end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path{prototype_id}
    else
      render :new
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id) #, prototype_id: params[:prototype_id]
  end
end
