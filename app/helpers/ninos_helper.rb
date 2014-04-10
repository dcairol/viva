module NinosHelper
  def ninos_sorted ninos
    ninos.sort_by{|nino| nino.nombre}
  end

  def opciones_combo opciones,value
    options_for_select(opciones.map{|r| [r,r] },value)
  end

  def definido? value
  	value.present? ? value : 'No definido'
  end

  def tiene_o_no value
  	value.present? ? value : 'No tiene'
  end
end
