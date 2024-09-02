class Congregacao < ApplicationRecord
  validates :descricao, presence: true
  has_many :literaturas
  has_many :entradas
end
