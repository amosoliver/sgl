class LiteraturasController < ApplicationController
  before_action :set_literatura, only: [:show, :edit, :update, :destroy]

  def index
    @literaturas = Literatura.all
  end

  def new
    @literatura = Literatura.new
    @congregacoes = Congregacao.all
  end

  def show
    
  end

  def edit
    @congregacoes = Congregacao.all
  end

  def create
    @literatura = Literatura.new(literatura_params)
    if @literatura.save
      redirect_to literaturas_path, notice: 'Literatura criada com sucesso'
    else
      render :new
    end
  end

  def update
    if @literatura.update(literatura_params)
      redirect_to literaturas_path, notice: 'Literatura editada com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @literatura.destroy
    redirect_to literaturas_path, notice: 'Literatura excluída com sucesso'
  end

  def relatorio
    @relatorio = Literatura.relatorio
  end

  private

  def set_literatura
    @literatura = Literatura.find(params[:id])
  end

  def literatura_params
    params.require(:literatura).permit(:congregacao_id, :trimestre, :ano, :valor)
  end
end
