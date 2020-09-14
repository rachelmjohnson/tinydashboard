- dashboard: base_dashboard
  title: base_dashboard
  layout: newspaper
  elements:
  - title: gender ratio
    name: gender ratio
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_pie
    fields: [users.gender, products.count]
    filters:
      users.gender: "-NULL"
    sorts: [products.count desc]
    limit: 500
    column_limit: 50
    query_timezone: Africa/Abidjan
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
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6
