class NinosDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

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
    @ninos ||= fetch_ninos
  end

  def fetch_ninos
    ninos = Nino.joins('LEFT OUTER JOIN oficinas ON oficinas.id = ninos.oficina_id LEFT OUTER JOIN familias ON familias.id = ninos.familia_id LEFT OUTER JOIN iglesias ON iglesias.id = ninos.iglesia_id').order("#{sort_column} #{sort_direction}")
    ninos = ninos.page(page).per_page(per_page)
    if params[:sSearch].present?
      ninos = ninos.where("ninos.nombre like :search or sexo like :search or iglesias.nombre like :search or familias.nombre like :search or oficinas.nombre like :search or ninos.tipo_acogimiento like :search", search: "%#{params[:sSearch]}%")
    end
    ninos
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[nombre edad sexo oficinas.nombre familias.nombre tipo_acogimiento iglesias.nombre]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end