module IglesiaHelper
  def map_iglesias iglesias
    iglesias.map{|iglesia| [iglesia.nombre,iglesia.id]}.sort
  end

  def nombre_iglesia obj
    obj.iglesia.nombre if obj.iglesia
  end

  def iglesias_sorted iglesias
    iglesias.sort_by{|iglesia| iglesia.nombre}
  end
end
