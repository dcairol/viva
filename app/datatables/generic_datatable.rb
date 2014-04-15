module GenericDatatable
  
  delegate :params, :h, :link_to, to: :@view
  
  delegate :datatable_key,to: :class

  def initialize(view,session)
    @view = view
    @session = session
    @session[datatable_key] = {}
  end

  private

  def fetch_data
    data = filter_data
    if params[:sSearch].present?
      data = search_data
    end
    session_object[:ids] = data.collect{|item| item.id }
    data.page(page).per_page(per_page)
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def where_filter; end

  def sort_column ; end

  def filter_data; end

  def search_data ; end
end