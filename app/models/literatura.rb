class Literatura < ApplicationRecord
  belongs_to :congregacao

  def self.relatorio
    sql = <<-SQL
    SELECT
        congregacoes.descricao AS congregacao,
        literaturas.trimestre AS trimestre_literatura,
        literaturas.ano,
        literaturas.valor AS valor_a_pagar,
        COALESCE(SUM(entradas.valor), 0) AS valor_pago,
        (literaturas.valor - COALESCE(SUM(entradas.valor), 0)) AS valor_pendente
    FROM literaturas
    INNER JOIN congregacoes ON literaturas.congregacao_id = congregacoes.id
    LEFT JOIN entradas 
        ON entradas.congregacao_id = congregacoes.id
        AND entradas.trimestre = literaturas.trimestre
        AND entradas.ano = literaturas.ano
        WHERE literaturas.trimestre = 3
    GROUP BY
        congregacoes.descricao,
        literaturas.trimestre,
        literaturas.ano,
        literaturas.valor

    SQL
  
    ActiveRecord::Base.connection.execute(sql)
  end
  
end
