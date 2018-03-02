view: order_items {
  sql_table_name: thelook_web_analytics.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_at {
    type: time
   # timeframes: [raw,date,month,week,year,month_name]
    sql: TIMESTAMP(${TABLE}.created_at) ;;
  }

  dimension: delivered_at {
    type: string
    sql: ${TABLE}.delivered_at ;;
  }

  ##test##

  dimension: inventory_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: returned_at {
    type: string
    sql: ${TABLE}.returned_at ;;
  }

  dimension: boolean {
    type: yesno
    sql: ${status} = "Complete" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format: "\C\A\D$#,##0.0"
    html: <font size="10">{{ value }}</font> ;;
  }

  dimension: shipped_at {
    type: string
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    link: {
      label: "test"
      url: "/dashboards/968"

    }
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  parameter: item_to_add_up {
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "sale_price"
    }
    allowed_value: {
      label: "Total Cost"
      value: "id"
    }
  }

  measure: dynamic_sum {
    label: "{% parameter item_to_add_up %}"
    type: sum
    sql: ${TABLE}.{% parameter item_to_add_up %} ;;
    value_format_name: "usd"
  }

  measure: count_filtered {
    type: count
    filters: {
      field: status
      value: "Returned"
    }
  }

  parameter: date_test {
    type: date_time
#     allowed_value: {
#       value: "< 100"
#     }
  }

  dimension: date_param {
    type: date
    sql: {% parameter date_test %} ;;
  }

  measure: ratio_drill_test {
    type: number
    sql: ${count_filtered} / ${count} ;;
  }

  measure: percent_of_total {
    type: percent_of_total
    sql: ${ratio_drill_test} ;;
    value_format_name: decimal_2
  }

  measure: average {
    type: average
    sql: ${TABLE}.sale_price ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.sale_price ;;
    value_format: "$#,##0.00;($#,##0.00)"
    #value_format_name: usd
  }

#   measure: total_revenue_neg {
#     type: number
#     sql: ${total_revenue}*-5 ;;
#     value_format: "$#,##0.00;($#,##0.00)"
#  }

  measure: order_count {
    type: count_distinct
    sql: ${TABLE}.order_id ;;
    #html: {{rendered_value}} || {{total_revenue._rendered_value}} of total;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}
