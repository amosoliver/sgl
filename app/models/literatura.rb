class Literatura < ApplicationRecord
  belongs_to :congregacao

  def self.relatorio
    joins(congregacao: :entradas)  # Correto para acessar as entradas através da congregacao
      .select('congregacoes.descricao AS congregacao_descricao, literaturas.valor AS literatura_valor, COALESCE(SUM(entradas.valor), 0) AS total_entradas')
      .group('congregacoes.descricao, literaturas.valor')
      .order('congregacoes.descricao') # Ou qualquer outra ordenação desejada
  end
end
