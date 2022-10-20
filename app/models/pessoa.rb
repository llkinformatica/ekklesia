class Pessoa < ApplicationRecord
    belongs_to :usuario
    has_one_attached :imagem
end
