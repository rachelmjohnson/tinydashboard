view: order_items {
  sql_table_name: thelook_web_analytics.order_items ;;

  filter: phase {
    type: string
    suggest_dimension: order_items.status
  }

  parameter: string_param {
    type: string
  }


  parameter: status_p {
    allowed_value: {
      label: "Cancelled"
      value: "Cancelled"
    }
    allowed_value: {
      label: "Complete"
      value: "Complete"
    }
    allowed_value: {
      label: "All"
      value: "All"
    }
    default_value: "All"
  }


filter: date_Test {
  type: date
}
  dimension: id {
    #primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_at {
    type: time
   timeframes: [raw,date,month,week,year,month_name,day_of_month,fiscal_quarter,fiscal_year]
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
    primary_key: yes
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
  }

  # dimension: status {
  #   type: string
  #   sql: CASE WHEN ${TABLE}.status = 'Shipped' THEN NULL ELSE ${TABLE}.status END;;
  #   link: {
  #     label: "test"
  #     url: "/dashboards/968"
  #   }
  #   link: {
  #     label: "test2"
  #     url: "/dashboards/1234"
  #   }
  #   action: {
  #     label: "actionylabel"
  #     url: "https://www.goog.com"
  #   }
  # }

  dimension: user_id {
    type: number
    description: "this is a description of the field for testing porpoises"
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    value_format_name: percent_0
    #html: <font color="green">{{ rendered_value }}</font>;;
    html: <div style="background: #60BD68; border-radius: 2px; color: #fff; font-size: 11px; font-weight: bold; width: 100%; text-align: center;">{{ rendered_value }}</div> ;;
  }

  measure: count {
    type: count
    link: {
      label: "google_test"
      url: "www.google.com"
    }
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${order_id}  ;;
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
    drill_fields: [id,status]
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
    type: count
    sql: ${TABLE}.sale_price ;;
    #value_format: "$#,##0.00;($#,##0.00)"
    #value_format_name: usd
  }

#   measure: total_revenue_neg {
#     type: number
#     sql: ${total_revenue}*-5 ;;
#     value_format: "$#,##0.00;($#,##0.00)"
#  }

  measure: order_count_1 {
    type: count
    sql: ${TABLE}.order_id , ${TABLE}.delivered_at ;;
    #html: {{rendered_value}} || {{total_revenue._rendered_value}} of total;;
    drill_fields: []
  }

  measure: order_count {
    type: number
    sql: ${order_count_1} ;;
    html: {{rendered_value}} ;;
    #html: {{rendered_value}} || {{total_revenue._rendered_value}} of total;;
  }



  measure: revenue_per_order {
    type: number
    sql:${total_revenue} / ${order_count} ;;
    value_format_name: usd
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name,
      status
    ]
  }
}
