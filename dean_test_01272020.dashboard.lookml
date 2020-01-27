- dashboard: dean_test_01272020
  title: dean_test_01272020
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_grid
    fields: [users.created_month, users.count, users.created_time]
    filters:
      order_items.order_id: ''
    sorts: [users.count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${users.count}*2",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: user_timezone
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_column_widths:
      users.created_month: 141
      users.created_time: 73
    series_cell_visualizations:
      users.count:
        is_active: true
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
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6
