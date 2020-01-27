- dashboard: dean_test_01272020
  title: Dean Test 01272020
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
      haegkljaegl: order_items.order_id
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
      haegkljaegl: order_items.order_id
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
      haegkljaegl: order_items.order_id
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
      haegkljaegl: order_items.order_id
    row: 0
    col: 0
    width: 8
    height: 9
  - name: Automagic Heat Map 1
    title: Automagic Heat Map 1
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_map
    fields: [users.latlong, order_items.count]
    filters:
      users.latlong_bin_level: '9'
      users.latlong: inside box from 48.922499263758255, -157.50000000000003 to 21.94304553343818,
        -90
    sorts: [order_items.count desc]
    limit: 5000
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
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
    map_latitude: 37.49229399862877
    map_longitude: -118.76220703125001
    map_zoom: 5
    hidden_fields: []
    y_axes: []
    listen:
      haegkljaegl: order_items.order_id
    row: 16
    col: 0
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: hi there hello
    row: 28
    col: 0
    width: 24
    height: 5
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
      haegkljaegl: aircraft.air_worth_date
    row: 9
    col: 13
    width: 11
    height: 7
  - name: Table vis
    title: Table vis
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.count, history.source]
    fill_fields: [history.source]
    filters:
      history.status: complete,error
    sorts: [history.count desc]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    series_labels:
      history.source: sauce
    series_column_widths:
      history.count: 196
      history.source: 162
    series_cell_visualizations:
      history.count:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      haegkljaegl: dashboard.created_hour_of_day
    row: 22
    col: 0
    width: 8
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 1 years
    allow_multiple_values: true
    required: false
  - name: haegkljaegl
    title: haegkljaegl
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: 119625_join_order
    explore: orders
    listens_to_filters: []
    field: order_items.order_id
