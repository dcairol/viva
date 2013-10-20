module NinosHelper
  def ninos_sorted ninos
    ninos.sort_by{|nino| nino.nombre}
  end
end
