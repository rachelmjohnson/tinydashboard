- dashboard: basic_dashboard_ryan
  title: Basic Dashboard ryan
  layout: newspaper
  description: Test description
  query_timezone: user_timezone
  embed_style:
    background_color: "#de10fa"
    show_title: true
    title_color: "#0b4515"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Pie Chart
    name: Pie Chart
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_pie
    fields: [users.gender, products.count]
    filters:
      users.gender: "-NULL"
    sorts: [products.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    show_value_labels: false
    font_size: 12
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors: 'palette: Looker Classic'
    series_colors: {}
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      Date: order_items.created_at_date
    row: 9
    col: 0
    width: 13
    height: 7
  - title: Column Chart
    name: Column Chart
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_grid
    fields: [users.created_month, users.count, users.created_time, users.first_name]
    sorts: [users.count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${users.count}*2",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    series_column_widths:
      users.created_month: 141
      users.created_time: 73
    series_cell_visualizations:
      users.count:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors: ['palette: Mixed Pastels']
    series_colors: {}
    reference_lines: []
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: equation}]
    hidden_fields: []
    y_axes: []
    series_types: {}
    listen:
      Date: order_items.created_at_date
    row: 0
    col: 8
    width: 8
    height: 9
  - title: Area Chart
    name: Area Chart
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_area
    fields: [users.created_month, order_items.created_at_month, order_items.order_count]
    pivots: [order_items.created_at_month]
    fill_fields: [users.created_month, order_items.created_at_month]
    filters:
      users.created_month: 2015/06/01 to 2016/03/07
    sorts: [users.created_month desc, order_items.created_at_month]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
    hide_legend: false
    hidden_fields: []
    y_axes: []
    listen:
      Date: order_items.created_at_date
    row: 0
    col: 16
    width: 8
    height: 9
  - title: Static Map - Regions
    name: Static Map - Regions
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.state, order_items.order_count]
    sorts: [order_items.order_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: users.created_time
    row: 0
    col: 0
    width: 8
    height: 9
  - title: Bar chart
    name: Bar chart
    model: 33352_filters_contains_does_not_respect_case_sensitive_no
    explore: aircraft
    type: looker_column
    fields: [aircraft.city, aircraft.count]
    sorts: [aircraft.count desc]
    limit: 5
    hidden_fields: []
    y_axes: []
    listen:
      Date: aircraft.air_worth_date
    row: 9
    col: 13
    width: 11
    height: 7
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    model: dcl_tiny_dashboard
    explore: orders
    listens_to_filters: []
    field: orders.created_date
