class FamiliasDatatable
  include GenericDatatable

  class << self
    def datatable_key
      :familias_datatable
    end
  end

  FILTERS = {todas: 'todas',activas: 'activas',no_activas: 'no_activas'}
  SELECT_FIELDS = 'familias.grupo,familias.telefonos,familias.correo,familias.direccion,familias.aval,familias.tipo_acogimiento,familias.perfil,familias.iglesia_id,iglesias.nombre,familias.nombre,iglesias.id,familias.id'

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Familia.count,
      iTotalDisplayRecords: familias.total_entries,
      aaData: data
    }
  end

private

  def data
    @familias.map do |familia|
      [
        link_to(familia.nombre, familia),
        familia.grupo,
        familia.telefonos,
        familia.correo,
        familia.direccion,
        familia.aval,
        familia.iglesia.nombre,
        familia.tipo_acogimiento,
        familia.perfil,
        link_to("Ver", familia),
        link_to("Editar", Rails.application.routes.url_helpers.edit_familia_url(only_path: true,id: familia)),
        link_to('Borrar', familia, method: :delete, data: { confirm: 'Esta seguro/a de borrar esta familia?' })
      ]
    end
  end

  def familias
    @familias ||= fetch_data
  end

  def where_filter
    case @session[:familias_filter]
    when FILTERS[:activas]
      @familias.joins(:ninos).uniq
    when FILTERS[:no_activas]
      @familias.joins('LEFT JOIN ninos ON ninos.familia_id = familias.id').where('ninos.familia_id IS NULL')
    when FILTERS[:todas]
      @familias
    else
      @familias
    end
  end

  def filter_data
    @familias = Familia.select(SELECT_FIELDS).joins('LEFT OUTER JOIN iglesias ON iglesias.id = familias.iglesia_id').order("#{sort_column} #{sort_direction}")
    @familias = @familias.page(page).per_page(per_page)
    where_filter
  end

  def search_data
    @familias.where("familias.nombre LIKE :search OR familias.grupo LIKE :search OR familias.telefonos LIKE :search OR familias.correo LIKE :search OR familias.direccion LIKE :search OR familias.aval LIKE :search OR iglesias.nombre LIKE :search OR familias.tipo_acogimiento LIKE :search OR familias.perfil LIKE :search ", search: "%#{params[:sSearch]}%")
  end

  def sort_column
    columns = %w[familias.nombre familias.grupo familias.telefonos familias.correo familias.direccion familias.aval iglesias.nombre familias.tipo_acogimiento familias.perfil]
    columns[params[:iSortCol_0].to_i]
  end

  def session_object
    @session[datatable_key]
  end
end