class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :edit, :update, :destroy] 

  def index
    @entradas = Entrada.joins(:congregacao).order('congregacoes.descricao', :congregacao_id, :trimestre)
  end
  
  

def edit
  @congregacoes = Congregacao.all

end

def show

end

def new
  @entrada = Entrada.new
  @congregacoes = Congregacao.all
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
if @entrada.update(entrada_params)
   redirect_to entradas_path, notice: 'Entrada editada com sucesso'
else
  render :edit
end

end

def destroy
  @entrada.destroy 

  redirect_to entradas_path , notice: 'Entrada deletada com sucesso'
end

private

def set_entrada
  @entrada = Entrada.find(params[:id])
end


def entrada_params
  params.require(:entrada).permit( :congregacao_id, :valor, :trimestre, :ano)
end


end
