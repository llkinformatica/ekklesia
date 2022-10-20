class Usuario < ApplicationRecord
    has_secure_password

    has_many :active_sessions, dependent: :destroy
    has_many :pessoas

    def self.authenticate_by(attributes)
        passwords, identifiers = attributes.to_h.partition do |name, value|
          !has_attribute?(name) && has_attribute?("#{name}_digest")
        end.map(&:to_h)
    
        raise ArgumentError, "One or more password arguments are required" if passwords.empty?
        raise ArgumentError, "One or more finder arguments are required" if identifiers.empty?
        if (record = find_by(identifiers))
          record if passwords.count { |name, value| record.public_send(:"authenticate_#{name}", value) } == passwords.size
        else
          new(passwords)
          nil
        end
      end    

      has_one_attached :imagem
      
end
