class NinosDatatable
  include GenericDatatable

  class << self
    def datatable_key
      :ninos_datatable
    end
  end

  FILTERS = {todos: 'todos',adopcion: 'adopcion',regresaron: 'regresaron'}

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Nino.count,
      iTotalDisplayRecords: ninos.total_entries,
      aaData: data
    }
  end


private

  def data
    ninos.map do |nino|
      [
        link_to(nino.nombre, nino),
        nino.edad,
        nino.sexo,
        nino.oficina.try(:nombre),
        nino.familia.try(:nombre),
        nino.tipo_acogimiento,
        nino.iglesia.try(:nombre),
        link_to("Ver", nino),
        link_to("Editar", Rails.application.routes.url_helpers.edit_nino_url(only_path: true,id: nino)),
        link_to('Borrar', nino, method: :delete, data: { confirm: 'Esta seguro/a de borrar a esta persona?' })
      ]
    end
  end

  def ninos
    @ninos ||= fetch_data
  end

  def where_filter
    case session_object[:filter]
    when FILTERS[:adopcion]
      @ninos.where(['causa_egreso IN (?,?)','Adopción Nacional','Adopción Internacional'])
    when FILTERS[:regresaron]
      @ninos.where(['causa_egreso = ?','Regreso al Grupo Familiar'])
    when FILTERS[:todos]
      @ninos
    else
      @ninos
    end
  end

  def filter_data
    @ninos = Nino.joins('LEFT OUTER JOIN oficinas ON oficinas.id = ninos.oficina_id LEFT OUTER JOIN familias ON familias.id = ninos.familia_id LEFT OUTER JOIN iglesias ON iglesias.id = ninos.iglesia_id').order("#{sort_column} #{sort_direction}")
    where_filter
  end

  def search_data
    @ninos.where("ninos.nombre like :search or sexo like :search or iglesias.nombre like :search or familias.nombre like :search or oficinas.nombre like :search or ninos.tipo_acogimiento like :search", search: "%#{params[:sSearch]}%")
  end

  def sort_column
    columns = %w[nombre edad sexo oficinas.nombre familias.nombre tipo_acogimiento iglesias.nombre]
    columns[params[:iSortCol_0].to_i]
  end

  def session_object
    @session[datatable_key]
  end
end