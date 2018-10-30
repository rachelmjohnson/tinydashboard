connection: "bigquery_publicdata_standard_sql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: distribution_centers {
  hidden: yes
}

explore: json_corelogic {
  persist_for: "24 hour"
}

# explore: web_events {
#   join: users {
#     sql_on: ${users.id} = ${web_events.user_id};;
#     type: left_outer
#     relationship: many_to_one
#   }
#   hidden: yes
# }

explore: inventory_items {
  join: distribution_centers {
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    type: left_outer
    relationship: many_to_one
  }
  hidden: yes
}


### Testing prewarming dashboard cache with schedules 8/27/18
datagroup: zach_test {
  sql_trigger:  SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP()) ;;
  max_cache_age: "1 hour"
}


explore: order_items {
  # fields: [ALL_FIELDS*, -users.order_created_day_of_week, -users.order_created_date]
  persist_with: zach_test
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
  hidden: yes
}

  explore: products {
  join: inventory_items {
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    type: left_outer
    relationship: many_to_one
  }
  hidden: yes
}

  explore: orders {
    from: users
  join: order_items {
    sql_on: ${orders.id} = ${order_items.user_id} ;;
    relationship: many_to_many
  }
  hidden: yes
  }

  explore: users {
    join: customer {
      from: users
      sql_on: ${users.id} = ${customer.id} ;;
      relationship: one_to_one
    }
    hidden: yes
  }
