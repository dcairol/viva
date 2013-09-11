module RegionesHelper
  def map_regiones regiones
    regiones.map{|region| [region.nombre,region.id]}
  end

  def nombre_region obj
    obj.region.nombre
  end
end
