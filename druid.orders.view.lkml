view: orders {
  sql_table_name: druid.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _ {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__time ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: order_amount {
    type: number
    sql: ${TABLE}.order_amount ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: id_yesno {
    type: yesno
    sql: ${id} in (1, 3, 5, 6, 7, 10, 12, 14, 15)  ;;
#     sql: ${id}=1 OR ${id}=3 OR ${id}=5 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.name, order_items.count]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
    }

    measure: approx_distinct {
      type: number
      sql: approx_count_distinct(${id}) ;;
    }
}
