- dashboard: tiny_map_dashboard
  title: Tiny Map Dashboard
  layout: newspaper
  embed_style:
    background_color: "#5aa3f0"
    tile_background_color: "#5aa3f0"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - name: Automagic Heat Map
    title: Automagic Heat Map
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_map
    fields:
    - users.latlong
    - order_items.count
    filters:
      users.latlong_bin_level: '10'
      users.latlong: inside box from 40.979898069620155, -129.37500000000003 to 31.952162238024975,
        -106.87500000000001
    sorts:
    - order_items.count desc
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
    map_longitude: -118.65234375000001
    map_zoom: 5
    row: 0
    col: 0
    width: 24
    height: 5
  - name: Interactive Map - Circles
    title: Interactive Map - Circles
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_map
    fields:
    - users.latlong
    - order_items.count
    filters:
      users.state: California
    sorts:
    - order_items.count desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
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
    map_marker_color_mode: value
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
    map_latitude: 33.637489243170826
    map_longitude: -117.7397918701172
    map_zoom: 11
    row: 11
    col: 0
    width: 24
    height: 5
  - name: Interactive Map - Areas
    title: Interactive Map - Areas
    model: dcl_tiny_dashboard
    explore: order_items
    type: looker_map
    fields:
    - users.latlong
    - order_items.order_count
    filters:
      products.category: Dresses
      users.age_tier: 15 to 29
      users.state: Washington
    sorts:
    - order_items.order_count desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: areas
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
    map_latitude: 47.24194882163242
    map_longitude: -120.09155273437501
    map_zoom: 7
    row: 5
    col: 0
    width: 24
    height: 6
