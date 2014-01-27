class Nino < ActiveRecord::Base
  belongs_to :iglesia
  belongs_to :oficina
  belongs_to :familia

  TIPOS_ACOGIMIENTO = ["Emergencia","Corto Plazo","Largo Plazo"]

  validates :nombre, presence: true

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
