class PinsController < ApplicationController
	before_action :set_pin, only: [:like, :destroy, :edit, :update, :show]
  def index
  	@pins = Pin.all
  end

  def show

  end

  def new
  	@pin = Pin.new
  end

  def destroy
  	#pin = Pin.find(params[:id])
  	@pin.likes.delete_all
  	@pin.delete
  	redirect_to pins_path
  end


  def edit
#solo trae el formulario
  end

  def create
  		#Pin.create(pins_params)
  	@pin =Pin.new(pins_params)
  	@pin.user = current_user
  	if @pin.save!
  		redirect_to pins_path
  	else
  		redirect new_pin_path, notice: 'Error desconocido'
  	end
  
  end

  def like
  	#pin = Pin.find(params[:id])
  	#user = current_user
  	Like.create(pin: @pin, user: current_user)
  	redirect_to pins_path
  end

  def update
  	#como se ocupa el metodo privado set_pin, se ocupa @pin
  	@pin.update(pins_params)
  	redirect_to pins_path
  end


  private
  def pins_params
  	params.require(:pin).permit(:name, :desc, :photo)
  end

  def set_pin
  	@pin = Pin.find(params[:id])
  end

end
