# If necessary, uncomment the line below to include explore_source.
# include: "dcl_tiny_dashboard.model.lkml"

view: paola_aa_two {
  derived_table: {
    persist_for: "24 hours"
    explore_source: order_items {
      timezone: "UTC"
      column: traffic_source { field: users.traffic_source }
      column: count { field: users.count }
      column: created_date { field: users.created_date }
      filters: {
        field: users.count
        value: ">0"
      }
    }
  }
  dimension: traffic_source {}
  dimension: count {
    label: "Users count"
    type: number
  }
  dimension: created_date {
    type: date
  }
}
