view: comments_sql_runner {
  derived_table: {
    sql: SELECT pr.category, i.cost FROM `lookerdata.demo.products` pr join `lookerdata.demo.inventory_items` i on pr.id = i.product_id where pr.id > 200 LIMIT 10
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  set: detail {
    fields: [category, cost]
  }
}
