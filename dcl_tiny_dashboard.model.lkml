connection: "bigquery_publicdata_standard_sql"

aggregate_awareness: yes

# include all the views
include: "*.view.lkml"

# include all the dashboards
include: "*.dashboard.lookml"

explore: distribution_centers {
  hidden: yes
}

explore: json_corelogic {
  persist_for: "24 hour"
}


explore: correlated_test {}

explore: add_a_unique_name_1567555639 {}

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
  #sql_trigger:  SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP()) ;;
  max_cache_age: "1 minute"
}


explore: order_items {
  # fields: [ALL_FIELDS*, -users.order_created_day_of_week, -users.order_created_date]
  #persist_with: zach_test

  always_filter: {
    filters: [order_items.status_p: "All"]
  }
  sql_always_where:
  {% if order_items.status_p._parameter_value == 'All' %} 1=1 {% else %}
    ${status} = {{ order_items.status_p._parameter_value }}
  {% endif %};;

  fields: [ALL_FIELDS*, -users.test_users*]
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
  label: "Products Test change"
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
  access_filter: {
    field: users.age
    user_attribute: testinguser
  }
  join: customer {
    from: users
    sql_on: ${users.id} = ${customer.id} ;;
    relationship: one_to_one
  }
  hidden: yes
}


  explore: test {}
