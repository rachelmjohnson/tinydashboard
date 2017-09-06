connection: "bigquery_publicdata_standard_sql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: distribution_centers {}

explore: web_events {}

explore: inventory_items {}

explore: order_items {
  join: users {
    sql_on: ${users.id} = ${order_items.user_id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: inventory_items {
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: products {
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    type: left_outer
    relationship: many_to_one
  }
}

explore: products {
#  join: inventory_items {
#    sql_on:  ;;
#  }
}
