module OficinasHelper
  def map_oficinas oficinas
    oficinas.map{|oficina| [oficina.nombre,oficina.id]}
  end

  def nombre_oficina obj
    obj.oficina.nombre
  end
end
