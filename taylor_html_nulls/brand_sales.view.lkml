explore: brand_sales {
  join: add_ons {
    relationship: one_to_one
    sql:  ;;
  }
}

view: add_ons {
  parameter: brand_selector {
    type: unquoted
    allowed_value: {label: "All" value: "all"}
    allowed_value: {label: "A" value: "a"}
    allowed_value: {label: "B" value: "b"}
    allowed_value: {label: "C" value: "c"}
  }
  dimension: schema_type {
    description: "Basic or advanced, used for easier code maintenance"
    sql: {% if brand_selector._parameter_value == 'C' %}
    'generic'
    {% else %}
    'advanced'
    {% endif %}
    ;;
  }
}

# These raw tables mimic physical tables in the database that exist: one for all brands unioned together, and one for each brand
view: brand_sales_raw_all {
  derived_table: {
    sql:SELECT 'A' AS brand,  1 as id, 10 as sale_line_item
        UNION ALL
        SELECT 'A', 2, 10
        UNION ALL
        SELECT 'B',  3, 30
        UNION ALL
        SELECT 'B',  4, 30
        UNION ALL
        SELECT 'C',  5, NULL
         ;;
  }
}
view: brand_sales_raw_a {
  derived_table: {
    sql:SELECT 'A' AS brand,  1 as id, 10 as sale_line_item
        UNION ALL
        SELECT 'A', 2, 10;;
  }
}
view: brand_sales_raw_b {
  derived_table: {
    sql:SELECT 'B',  3, 30
        UNION ALL
        SELECT 'B',  4, 30 ;;
  }
}
view: brand_sales_raw_c {
  derived_table: {
    sql:SELECT 'C',  5, NULL;;
  }
}

view: brand_sales {
  sql_table_name: brand_sales_raw_{{ add_ons.brand_selector._parameter_value }}.SQL_TABLE_NAME ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
  }

  dimension: include_in_sale_aggregates {
    type: yesno
    sql: ${brand} != 'C' ;;
  }

  dimension: sale_line_item {
    type: number
    sql: COALESCE(${TABLE}.sale_line_item,0) ;;
    html:
    {% if brand._value == 'C' %}
      No values
    {% else %}
      {{rendered_value}}
    {% endif %}
    ;;
  }

  # Option 1: allow incorrect aggregates. Brand C will be 0 instead of NULL, lowering the average.
  measure: average_sale {
    type: average
    sql: ${sale_line_item} ;;
  }

  # Option 2: put error message on measure. Never aggregate measure.
  measure: average_sale_per_brand {
    type: average
    sql: ${sale_line_item} ;;
    html:
    {% if brand._value == 'C' %}
      No values
    {% else %}
      {{rendered_value}}
    {% endif %};;
  }

  # Option 3: dynamically use the appropriate one depending on if brand is in the query
  measure: average_sale_exclusive {
    type: average
    sql: ${sale_line_item} ;;
    filters: [add_ons.schema_type: "advanced"]
  }

}
