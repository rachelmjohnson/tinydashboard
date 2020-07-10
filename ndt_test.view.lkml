# If necessary, uncomment the line below to include explore_source.
# include: "the_file_that_defines_explore_order_items.lkml"

view: add_a_unique_name_1567555639 {
  derived_table: {
    explore_source: order_items {
      column: state { field: users.state }
      column: full_name { field: users.full_name }
      column: id { field: users.id }
      column: created_date { field: users.created_date }
      column: city { field: users.city }
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
