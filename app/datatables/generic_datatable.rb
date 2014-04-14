module GenericDatatable
  
  delegate :params, :h, :link_to, to: :@view

  def initialize(view,session)
    @view = view
    @session = session
    set_session
  end

  private

  def fetch_data    
    data = filter_data
    if params[:sSearch].present?
      data = search_data
    end
    data
  end

  def set_session
    search = {}
    search[:sort_column] = sort_column
    search[:sort_direction] = sort_direction
    search[:sSearch] = params[:sSearch]
    @session[:search] = search
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