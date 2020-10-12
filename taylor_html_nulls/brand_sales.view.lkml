explore: brand_sales {
  always_filter: {
    filters: [add_ons.brand_selector: "all"]
  }
  join: add_ons {
    relationship: one_to_one
    sql:  ;;
  }
}

# This view adds filter-only fields, no actual data connection, just something for end users to interact with
view: add_ons {
  parameter: brand_selector {
    type: unquoted
    allowed_value: {label: "All" value: "all"}
    allowed_value: {label: "A" value: "a"}
    allowed_value: {label: "B" value: "b"}
    allowed_value: {label: "C" value: "c"}
  }
  dimension: schema_type_parameter {
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
        SELECT 'B',  3, 40
        UNION ALL
        SELECT 'B',  4, 20
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

# This is the master view which can be used across different brands
view: brand_sales {
  sql_table_name:
  {% if add_ons.brand_selector._parameter_value == 'all' %} ${brand_sales_raw_all.SQL_TABLE_NAME}
  {% elsif add_ons.brand_selector._parameter_value == 'a' %} ${brand_sales_raw_a.SQL_TABLE_NAME}
  {% elsif add_ons.brand_selector._parameter_value == 'b' %} ${brand_sales_raw_b.SQL_TABLE_NAME}
  {% else %} ${brand_sales_raw_c.SQL_TABLE_NAME}
  {% endif %};;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
  }

  dimension: brand_is_advanced {
    type: yesno
    sql: ${brand} in ('A','B') ;;
  }

  dimension: sale_line_item {
    type: number
    sql: COALESCE(${TABLE}.sale_line_item,0) ;;
    html:
    {% if brand_is_advanced._value == 'Yes' %}
      {{rendered_value}}
    {% else %}
      No values
    {% endif %}
    ;;
  }

  # Option 1: allow incorrect aggregates. Brand C will be 0 instead of NULL, lowering the average.
  measure: average_sale_inaccurate {
    type: average
    sql: ${sale_line_item} ;;
  }

  # Option 2: Returns 2 rows, one for aggregated and one with error message. the double rows might confuse. (forces brand_is_advanced yes/no into results)
  measure: average_sale_split {
    type: average
    sql: ${sale_line_item} ;;
    html:
    {% if brand_is_advanced._value == 'Yes' %}
      {{rendered_value}}
    {% else %}
      No values
    {% endif %};;
  }

  # Option 3: Return accurate results in one row
  measure: average_sale_combined {
    type: average
    sql: ${sale_line_item} ;;
    filters: [brand_is_advanced: "Yes"]
  }

}
