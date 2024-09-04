class CongregacoesController < ApplicationController

  before_action :set_congregacao, only: [:show, :edit, :destroy, :update]
  def index
    @congregacoes = Congregacao.order(:descricao)
  end

  def show
    
  end

  def new
    @congregacao = Congregacao.new
  end

  def create
    @congregacao = Congregacao.new(congregacao_params)
    if @congregacao.save
      redirect_to  congregacoes_path  , notice: 'Congregação criada com sucesso.'
    else
      render :new
    end
  end
  
  def edit 
    
  end

  def update
    if @congregacao.update(congregacao_params)
      redirect_to @congregacao, notice: 'Congregação editada com sucesso'      
    else
      render :edit
    end
  end

  def destroy
    @congregacao.destroy!
    redirect_to congregacoes_path, notice: 'Congregação excluída com sucesso'
  end

  private
  def set_congregacao
    @congregacao = Congregacao.find(params[:id])
  end
  def congregacao_params
    params.require(:congregacao).permit(:descricao)
  end
end
