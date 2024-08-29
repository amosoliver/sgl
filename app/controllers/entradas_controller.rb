class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :edit, :update, :destroy] 

def index
  @entradas = Entrada.all
end

def edit
  
end

def show

end

def new
  
end

def create
  @entrada = Entrada.new(entrada_params)
  if @entrada.save
    redirect_to entradas_path, notice: 'Entrada criada com sucesso'
  else
    render :new
  end
end
def update
  @entrada.update(entrada_params)
end

def destroy
  
end

private

def set_congregacao

end

def entrada_params
  
end

end
