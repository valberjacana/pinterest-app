class PinsController < ApplicationController
  before_action :set_pin, only: [:like, :destroy, :edit, :update, :show]

  #Permite agregar un saneador para que otros no puedan agregar nuevos parámetros
  def create
    #Pin.new(pins_params)
    #A través de esto podemos controlar si el usuario grabo o no la creación del pin
    #y entregar un mensaje de error
    @pin = Pin.new(pins_params)
    @pin.user = current_user
    #o también se puede colocar como: @pin.user_id = current_user_id
    if @pin.save!
      redirect_to pins_path
    else
      redirect new_pin_path, notice: 'Error desconocido'
    end
  end 

  def edit
  end

  def destroy
    @pin.likes.delete_all
    #pin = Pin.find(params[:id])
    @pin.delete
    redirect_to pins_path
  end

  def index
      @pins = Pin.all
  end

  def like
    ##user = current_user
    #Se reemplaza con la definición realizada más abajo para indicar que en @pin, se
    #guardara el valor del id, pero solo será utilizada para este archivo "def set_pin"
    #y arriba en la primera línea se define "before_action :set_pin, only: [:like, :destroy]"
    #indica que se debe ejecutar primero el set pin antes que cualquier cosa
    #y solamente se va a utilizar en like y destroy

    #pin = Pin.find(params[:id])
    Like.create(pin: @pin, user: current_user)
    redirect_to pins_path
  end 

  def new
    @pin = Pin.new
  end

  def show
  end

  def update
    @pin.update(pins_params)
    redirect_to pins_path
  end


  #Indica métodos que afectan solo a esta clase
  private

  def pins_params
    params.require(:pin).permit(:name, :desc, :photo)
  end 

  def set_pin
    @pin = Pin.find(params[:id])
  end

end

