class Familia < ActiveRecord::Base
  belongs_to :iglesia
  has_many :ninos
  validates :nombre, presence: true

  def self.to_csv options={}
    CSV.generate(options) do |csv|
      csv << ["Familia","Grupo","Teléfonos","Email","Direccion","Aval","Iglesia","Tipo Acogimiento","Perfil"]
      all.each do |familia|
        csv << [familia.nombre,familia.grupo,familia.telefonos,familia.correo,familia.direccion,familia.aval,familia.iglesia.try(:nombre),familia.tipo_acogimiento,familia.perfil]
      end
    end
  end
end
