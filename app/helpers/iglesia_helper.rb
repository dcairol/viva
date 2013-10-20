module IglesiaHelper
  def map_iglesias iglesias
    iglesias.map{|iglesia| [iglesia.nombre,iglesia.id]}
  end

  def nombre_iglesia obj
    obj.iglesia.nombre if obj.iglesia
  end
end
