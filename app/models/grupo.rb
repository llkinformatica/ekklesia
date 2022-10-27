class Grupo < ApplicationRecord
    acts_as_list
    include ActionView::RecordIdentifier    

    def self.default_scope
        order(:position)
    end

    broadcasts_to -> (grupo) { :grupo_stream }
    after_commit :update_grupos

    def update_grupos
        broadcast_update_to "grupo_#{self.id}", partial: "grupos/grupos", target: "grupo_#{self.id}"
    end
end
