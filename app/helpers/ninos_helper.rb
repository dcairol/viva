module NinosHelper
  def ninos_sorted ninos
    ninos.sort_by{|nino| nino.nombre}
  end

  def opciones_combo opciones,value
    options_for_select(opciones.map{|r| [r,r] },value)
  end
end
