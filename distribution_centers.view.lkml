view: distribution_centers {
  sql_table_name: thelook_web_analytics.distribution_centers ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    value_format: "0.00"
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count_name {
    type: number
    sql: ${name_filter}/${filter_measure_name} ;;
  }

  measure: name_filter {
    type: count
    filters: {
      field: name
      value: "Charleston SC"
    }
  }

  measure: filter_measure_name {
    type: count
    filters: {
      field: name
      value: "Chicago IL"
    }
  }

  measure: count {
    type: count
    drill_fields: [id, name, products.count]
  }
}
