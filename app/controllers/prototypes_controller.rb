class PrototypesController < ApplicationController
  def index
    @Prototypes = Prototype.all.order(id: "DESC")
  end

  # def new
  #   @Prototype = Prototype.new
  # end

  def create
    Prototype.create(prototype_params)
    if @Prototype.save
      redirect_to prototype_path{prototype.id}
    else
      render :index
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:image).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
