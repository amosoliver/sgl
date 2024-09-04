class LiteraturasController < ApplicationController
  before_action :set_literatura, only: [:show, :edit, :update, :destroy]

  def index
    @literaturas = Literatura.order(:id)
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
    raw_result = Literatura.relatorio
    @relatorio = raw_result.map do |row|
      total = row['valor_a_pagar'].to_f
      pago = row['valor_pago'].to_f
      percentual_pago = total > 0 ? (pago / total * 100) : 0
  
      linha_classe = if percentual_pago >= 100
                       'table-success'
                     elsif percentual_pago >= 80
                       'table-warning'
                     else
                       'table-danger'
                     end
  
      row.merge('percentual_pago' => percentual_pago, 'linha_classe' => linha_classe)
    end
  
    Rails.logger.debug "Tipo de @relatorio: #{@relatorio.class.name}" # Verifique o tipo
    Rails.logger.debug "Conteúdo de @relatorio: #{@relatorio.inspect}" # Verifique o conteúdo
  end
  
  
  private

  def set_literatura
    @literatura = Literatura.find(params[:id])
  end

  def literatura_params
    params.require(:literatura).permit(:congregacao_id, :trimestre, :ano, :valor)
  end
end
