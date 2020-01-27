# If necessary, uncomment the line below to include explore_source.
# include: "dcl_tiny_dashboard.model.lkml"

view: test_ndt_test {
  derived_table: {
    explore_source: order_items {
      column: state { field: users.state }
      column: full_name { field: users.full_name }
      column: id { field: users.id }
      column: created_date { field: users.created_date }
      column: city { field: users.city }
      filters: {
        field: users.country
        value: ""
      }
    }
  }
  dimension: state {}
  dimension: full_name {}
  dimension: id {
    type: number
  }
  dimension: created_date {
    type: date
  }
  dimension: city {}
}
