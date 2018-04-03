CSV.generate({col_sep: ';', row_sep: "\r\n"}) { |csv|
  csv << export_column_titles(@columns)
  @plannings.each do |planning|
    render partial: 'routes/index.excel', formats: [:excel], locals: {planning: planning, csv: csv}
  end
}
