module RegionesHelper
  def map_regiones regiones
    regiones.map{|region| [region.nombre,region.id]}.sort
  end

  def nombre_region obj
    obj.region.nombre if obj.region
  end
end
