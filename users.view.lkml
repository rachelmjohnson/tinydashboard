view: users {
  sql_table_name: thelook_web_analytics.users ;;

  filter: state_test_filter {
    type: string
    hidden: yes
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    #label: "{% if  _view._name == 'users' %} {{'User Age'}} {% elsif _view._name == 'customer' %} {{ 'Customer Age' }} {% else %} {{ 'Employee Age'}} {% endif %}"
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [15,30,45,60,75]
    style: integer
    sql: ${TABLE}.age ;;
  }

  dimension: dynamic_age_tier {
    type: number
    sql:round(${TABLE}.age / {% parameter age_tier_bucket_years %}, 0) * {% parameter age_tier_bucket_years %};;
  }

  parameter: age_tier_bucket_years {
    type: number
  }

  dimension: image_test {
    type: string
    sql: 'string' ;;
    #html: <img src="https://en.wikipedia.org/wiki/Main_Page#/media/File:PasserPyrrhonotusKeulemans.jpg" /> ;;
    html: <img src= "https://www.birdlife.org/sites/default/files/styles/1600/public/slide.jpg?itok=HRhQfA1S" /> ;;
  }

  dimension: stringness_test {
    type: string
    sql: "00\"1515" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    html: <div style="text-align:center;float:left;font-weight: bold">{{ value }}</div> ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    drill_fields: [state]
  }

  dimension: west {
    case: {
      when: {
        sql: ${state} = 'California' ;;
        label: "West"
      }
      else: " "
    }
  }

  dimension: east {
    case: {
      when: {
        sql: ${state} = 'New York';;
        label: "East"
      }
      else: " "
    }
  }

  dimension: region {
    type: string
    sql: concat(${west},${east}) ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week
    ]
    convert_tz: no
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_2 {
    type: date
    sql: ${TABLE}.created_at ;;
  }

  filter: mydate {
    type: date
  }

  dimension: startfield {
    type: date
    sql: {% date_start mydate %} ;;
  }

  dimension: endfield {
    type: date
    sql: {% date_end mydate %} ;;
  }

  ## for day_of_week validation error##
  # dimension_group: order_created {
  #   type: time
  #   timeframes: [date, day_of_week]
  #   sql: ${inventory_items.created_at_raw} ;;
  # }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: filter_param_test {
    type: string
    sql: ${TABLE}.{% parameter filter_col %} ;;
  }

  parameter: filter_col {
    type: unquoted
    allowed_value: {
      label: "First Name"
      value: "first_name"
    }
    allowed_value: {
      label: "Last Name"
      value: "last_name"
    }
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}," ",${last_name}) ;;
    drill_fields: [age]
    order_by_field: id
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: latlong {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  parameter: param_label {
    type: unquoted
  }
#   dimension: state {
#     type: string
#     sql: ${TABLE}.state ;;
#     label: "{% parameter param_label %}"
#   }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
    order_by_field: age
  }

#   dimension: liquid_test {
#     type: string
#     sql: {% if order_items._in_query %}
#     ${users.state}
#     {% else %}
#     ${users.gender}
#     {% endif %};;
#   }

  measure: percentile_test {
    type: percentile
    percentile: 70
    sql: ${TABLE}.age ;;
  }

  measure: percentile_filter {
    type: yesno
    sql: ${age} > ${percentile_test};;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  measure: count_facebook {
    type: sum
    sql: case when ${traffic_source} = 'Facebook' then 1 else 0 end ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    html: <p style="font-size:30px"> {{value}} </p> ;;
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }



  measure: avg_age {
    type: average
    sql: ${TABLE}.age ;;
  }

  dimension: thing {
    sql: {% if other_thing._is_filtered %} x {% else %} y {% endif %} ;;
  }

  dimension: other_thing {
    type: number
    sql: select 1;;
  }

}
