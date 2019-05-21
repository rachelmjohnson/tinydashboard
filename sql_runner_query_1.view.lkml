view: sql_runner_query_1 {
  derived_table: {
    sql: SELECT
        users.age  AS users_age,
        users.state  AS users_state,
        CONCAT(users.first_name," ",users.last_name)  AS users_full_name,
        users.id  AS users_id,
        CAST(users.created_at  AS DATE) AS users_created_date,
        users.city  AS users_city
      FROM thelook_web_analytics.order_items  AS order_items
      LEFT JOIN thelook_web_analytics.users  AS users ON users.id = order_items.user_id

      GROUP BY 1,2,3,4,5,6
      ORDER BY 5 DESC
      LIMIT 50
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_age {
    type: number
    sql: ${TABLE}.users_age ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.users_state ;;
  }

  dimension: users_full_name {
    type: string
    sql: ${TABLE}.users_full_name ;;
  }

  dimension: users_id {
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: users_created_date {
    type: date
    sql: ${TABLE}.users_created_date ;;
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.users_city ;;
  }

  set: detail {
    fields: [
      users_age,
      users_state,
      users_full_name,
      users_id,
      users_created_date,
      users_city
    ]
  }
}
