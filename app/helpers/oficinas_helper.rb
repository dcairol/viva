module OficinasHelper
  def map_oficinas oficinas
    oficinas.map{|oficina| [oficina.nombre,oficina.id]}.sort
  end

  def nombre_oficina obj
    obj.oficina.nombre if obj.oficina
  end
end
