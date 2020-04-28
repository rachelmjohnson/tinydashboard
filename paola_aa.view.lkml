# If necessary, uncomment the line below to include explore_source.
# include: "dcl_tiny_dashboard.model.lkml"

view: paola_aa {
  derived_table: {
    persist_for: "12 hours"
    explore_source: order_items {
      timezone: "Africa/Abidjan"
      column: count { field: users.count }
      column: traffic_source { field: users.traffic_source }
    }
  }
  dimension: count {
    label: "Users count"
    type: number
  }
  dimension: traffic_source {}
}
