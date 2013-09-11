module FamiliaHelper
  def map_familias familias
    familias.map{|familia| [familia.nombre,familia.id]}
  end

  def nombre_familia obj
    obj.familia.nombre
  end
end
