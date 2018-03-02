connection: "bigquery_publicdata_standard_sql"

include: "*.view.lkml"         # include all views in this project
#include: "*.dashboard.lookml"  # include all dashboards in this project


explore: order_items {
  # fields: [ALL_FIELDS*, -users.order_created_day_of_week, -users.order_created_date]
  join: users {
    relationship: many_to_one
    sql_on: ${users.id} = ${order_items.user_id} ;;
  }
}
