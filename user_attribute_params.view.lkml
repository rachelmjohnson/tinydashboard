explore: user_attribute_params {}

view: user_attribute_params {
  derived_table: {
    sql:  select id, status from thelook_web_analytics.order_items
    where id = {% parameter filter_test %}
    order by 1 limit 10;;
  }

  dimension: status {
    sql: ${TABLE}.status ;;
  }

  parameter: filter_test {
    type: number
  }
}