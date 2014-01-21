class RemoteDatatable
  delegate :params, :datatable_row, :to => :@view

  def initialize(view, scope, datatable_row, columns)
    @view = view
    @scope = scope
    @columns = columns
    @search_string = @columns.collect{ |c| "#{c} like :search"}.join(" OR ")
    @datatable_row = datatable_row
  end

  def as_json(options = {})
    {
      :sEcho => params[:sEcho].to_i,
      :iTotalRecords => @scope.count,
      :iTotalDisplayRecords => items.total_entries,
      :aaData => data
    }
  end

private

  def data
    items.map do |item|
      @view.send(@datatable_row, item)
    end
  end

  def items
    @items ||= fetch_items
  end

  def fetch_items
    items = @scope.order("#{sort_column} #{sort_direction}")
    items = items.page(page).per_page(per_page)
     if params[:sSearch].present?
        items = items.where(@search_string, :search => "%#{params[:sSearch]}%")
    end
    items
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    @columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end