view: inventory_items {
  sql_table_name: thelook_web_analytics.inventory_items ;;

set: test_set {
fields: [id]
}

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created_at {
    type: time
    sql: TIMESTAMP(${TABLE}.created_at) ;;
    timeframes: [day_of_week]
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }

#test

  dimension: dummy_three {
    case: {
      when: {
        label: "Count"
        sql: 1=1 ;;
      }
      when: {
        label: "Count Inventory Items"
        sql: 1=1 ;;
      }
      when: {
        label: "Count Orders"
        sql: 1=1 ;;
      }
    }
    }


  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    drill_fields: [order_items.id]
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: sold_at {
    type: string
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_name, products.name, products.id, order_items.count]
  }

}
