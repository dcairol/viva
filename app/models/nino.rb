require 'csv'

include NinosHelper

class Nino < ActiveRecord::Base
  belongs_to :iglesia
  belongs_to :oficina
  belongs_to :familia

  TIPOS_ACOGIMIENTO = ["Emergencia","Corto Plazo","Largo Plazo"]

  validates :nombre, presence: true

  def self.to_csv options={}
    CSV.generate(options) do |csv|
      csv << ["Cedula","Nombre","Grupo de Hermanos","Número de Hermanos","Medida de Protección","Fecha Medida de Protección","Fecha vencimiento medida","Fecha de Nacimiento","Subvencionado","Tiene discapacidad","Tipo de discapacidad","Referido por","Situación Legal","Código Alternativa","Tiene subsidio","Tiene ayuda de instituciones","Causa permanencia","Escolaridad","Servicio de Apoyo","Edad","Sexo","Fecha Ingreso","Motivo Ingreso","Fecha Egreso","Motivo Egreso","Causa Egreso","Oficina","Familia","Tipo de Acogimiento","Iglesia"]
      all.each do |nino|
        csv << [nino.cedula,nino.nombre,si_o_no(nino.grupo_hermanos),nino.numero_hermanos,nino.medida_proteccion,nino.fecha_medida_proteccion,nino.fecha_vencimiento_medida,nino.fecha_nacimiento,si_o_no(nino.subvencionado),si_o_no(nino.discapacidad),nino.tipo_discapacidad,nino.referencia,nino.situacion_legal,nino.codigo_alternativa,si_o_no(nino.subsidio_aprobado),si_o_no(nino.ayudas_instituciones),nino.causa_permanencia,nino.escolaridad,nino.servicio_apoyo,nino.edad,nino.sexo,nino.fecha_ingreso,nino.motivo_ingreso,nino.fecha_egreso,nino.motivo_egreso,nino.causa_egreso,nino.nombre_oficina,nino.nombre_familia,nino.tipo_acogimiento,nino.nombre_iglesia]
      end
    end
  end

  def nombre_iglesia
    iglesia ? iglesia.nombre : ''
  end

  def nombre_oficina
    oficina ? oficina.nombre : ''
  end

  def nombre_familia
    familia ? familia.nombre : ''
  end

end

module OpcionesCombo

  REFERENCIAS = ["Oficina-PANI","Directa - Familia","Directa - Otro","Autoridad - Judicial"]
  MEDIDAS_PROTECCION = ["Abrigo Temporal","Educativa","Tratamiento","Cuido Provisional","Otra"]
  SITUACIONES_LEGALES = ["DECLARATORIA JUDICIAL EN ABANDONO EN TRAMITE (DJAT)","DECLARATORIA JUDICIAL EN ESTADO DE ABANDONO (DJEA)","DECLARATORIA DE ADOPTABILIDAD","DEPOSITO JUDICIAL (DJ)","OTRO"]
  INSTITUCIONES = ["MEP","IMAS","FONABE","INA","Reg. No Contrib","Otra Ayuda"]
  TIPOS_DISCAPACIDAD = ["Auditiva","Cognitiva","Motora","Múltiple","Visual","No Tiene"]
  CAUSAS_PERMANENCIA = ["Sin información","Enfermedad","Trabajo con familia","Reingreso","Sin alt.prot.con disc.","Gpo herm. numeroso","Embarazada","Madre Adolescente","Madre Trabajadora","Orfandad","Recuperación de adicciones","Const. Proy. vida","Explotación sexual","Otros"]
  ESCOLARIDADES = ["Sin información","Jardín de Niños","Preparatoria","Primero","Segundo","Tercero","Cuarto","Quinto","Sexto","Séptimo","Octavo","Noveno","Décimo","Undécimo","No asiste","No aplica"]
  SERVICIOS_APOYO = ["Ayuda Técnica","Tutoría Terapéutica","Fisioterapia","Terapia del Lenguaje","Terapia Ocupacional","Educación Especial","Seguimiento Farmacológico"]
  CAUSAS_EGRESO = ["Edad","Regreso al Grupo Familiar","Hogar de Acogimiento Familiar","Egreso sin autorización","Defunción","Adopción Nacional","Adopción Internacional","ONG","Albergue Pani"]
end
