- dashboard: test_axis
  title: Test Axis
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: add_a_unique_name_1516120606
      title: Untitled Visualization
      model: dcl_tiny_dashboard
      explore: order_items
      type: looker_column
      fields: [users.age_tier, users.count]
      fill_fields: [users.age_tier]
      sorts: [users.age_tier]
      limit: 500
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
      #y_axis_tick_density_custom: 10
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: true, showValues: true, tickDensity: custom, tickDensityCustom: '12',
          type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: users.count,
              name: Users Count, axisId: users.count}]}]
