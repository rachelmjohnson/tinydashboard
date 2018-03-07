view: surf_log {
  sql_table_name: surf.surf_log ;;

  dimension: approx_crowd {
    type: number
    sql: ${TABLE}.approx_crowd ;;
  }

  dimension: board {
    type: string
    sql: ${TABLE}.board ;;
  }

  dimension: break {
    type: string
    sql: ${TABLE}.break ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension_group: log {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.log_date ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: observed_wind {
    type: string
    sql: ${TABLE}.observed_wind ;;
  }

  dimension: primary_swell_degree {
    type: number
    sql: ${TABLE}.primary_swell_degree ;;
  }

  dimension: primary_swell_direction {
    type: string
    sql: ${TABLE}.primary_swell_direction ;;
  }

  dimension: primary_swell_height_in_ft {
    type: number
    sql: ${TABLE}.primary_swell_height_in_ft ;;
  }

  dimension: primary_swell_period_in_seconds {
    type: number
    sql: ${TABLE}.primary_swell_period_in_seconds ;;
  }

  dimension: secondary_swell_degree {
    type: number
    sql: ${TABLE}.secondary_swell_degree ;;
  }

  dimension: secondary_swell_direction {
    type: string
    sql: ${TABLE}.secondary_swell_direction ;;
  }

  dimension: secondary_swell_height_in_ft {
    type: number
    sql: ${TABLE}.secondary_swell_height_in_ft ;;
  }

  dimension: secondary_swell_period_in_seconds {
    type: number
    sql: ${TABLE}.secondary_swell_period_in_seconds ;;
  }

  dimension: tide_movement {
    type: string
    sql: ${TABLE}.tide_movement ;;
  }

  dimension: tide_start {
    type: string
    sql: ${TABLE}.tide_start ;;
  }

  dimension_group: time_in {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time_in ;;
  }

  dimension_group: time_out {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time_out ;;
  }

  dimension: wave_height_max {
    type: string
    sql: ${TABLE}.wave_height_max ;;
  }

  dimension: wave_height_min {
    type: string
    sql: ${TABLE}.wave_height_min ;;
  }

  dimension: wetsuit {
    type: string
    sql: ${TABLE}.wetsuit ;;
  }

  dimension: who {
    type: string
    sql: ${TABLE}.who ;;
  }

  dimension: wind_degree {
    type: number
    sql: ${TABLE}.wind_degree ;;
  }

  dimension: wind_direction {
    type: string
    sql: ${TABLE}.wind_direction ;;
  }

  dimension: wind_speed_in_knots {
    type: string
    sql: ${TABLE}.wind_speed_in_knots ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
