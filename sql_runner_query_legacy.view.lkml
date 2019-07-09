view: sql_runner_query_legacy {
  derived_table: {
    sql: SELECT * FROM [fh-bigquery:weather_gsod.gsod1940]
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: stn {
    type: string
    sql: ${TABLE}.stn ;;
  }

  dimension: wban {
    type: string
    sql: ${TABLE}.wban ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  dimension: mo {
    type: string
    sql: ${TABLE}.mo ;;
  }

  dimension: da {
    type: string
    sql: ${TABLE}.da ;;
  }

  dimension: temp {
    type: string
    sql: ${TABLE}.temp ;;
  }

  dimension: count_temp {
    type: string
    sql: ${TABLE}.count_temp ;;
  }

  dimension: dewp {
    type: string
    sql: ${TABLE}.dewp ;;
  }

  dimension: count_dewp {
    type: string
    sql: ${TABLE}.count_dewp ;;
  }

  dimension: slp {
    type: string
    sql: ${TABLE}.slp ;;
  }

  dimension: count_slp {
    type: string
    sql: ${TABLE}.count_slp ;;
  }

  dimension: stp {
    type: string
    sql: ${TABLE}.stp ;;
  }

  dimension: count_stp {
    type: string
    sql: ${TABLE}.count_stp ;;
  }

  dimension: visib {
    type: string
    sql: ${TABLE}.visib ;;
  }

  dimension: count_visib {
    type: string
    sql: ${TABLE}.count_visib ;;
  }

  dimension: wdsp {
    type: string
    sql: ${TABLE}.wdsp ;;
  }

  dimension: count_wdsp {
    type: string
    sql: ${TABLE}.count_wdsp ;;
  }

  dimension: mxpsd {
    type: string
    sql: ${TABLE}.mxpsd ;;
  }

  dimension: gust {
    type: string
    sql: ${TABLE}.gust ;;
  }

  dimension: max {
    type: string
    sql: ${TABLE}.max ;;
  }

  dimension: flag_max {
    type: string
    sql: ${TABLE}.flag_max ;;
  }

  dimension: min {
    type: string
    sql: ${TABLE}.min ;;
  }

  dimension: flag_min {
    type: string
    sql: ${TABLE}.flag_min ;;
  }

  dimension: prcp {
    type: string
    sql: ${TABLE}.prcp ;;
  }

  dimension: flag_prcp {
    type: string
    sql: ${TABLE}.flag_prcp ;;
  }

  dimension: sndp {
    type: string
    sql: ${TABLE}.sndp ;;
  }

  dimension: fog {
    type: string
    sql: ${TABLE}.fog ;;
  }

  dimension: rain_drizzle {
    type: string
    sql: ${TABLE}.rain_drizzle ;;
  }

  dimension: snow_ice_pellets {
    type: string
    sql: ${TABLE}.snow_ice_pellets ;;
  }

  dimension: hail {
    type: string
    sql: ${TABLE}.hail ;;
  }

  dimension: thunder {
    type: string
    sql: ${TABLE}.thunder ;;
  }

  dimension: tornado_funnel_cloud {
    type: string
    sql: ${TABLE}.tornado_funnel_cloud ;;
  }

  set: detail {
    fields: [
      stn,
      wban,
      year,
      mo,
      da,
      temp,
      count_temp,
      dewp,
      count_dewp,
      slp,
      count_slp,
      stp,
      count_stp,
      visib,
      count_visib,
      wdsp,
      count_wdsp,
      mxpsd,
      gust,
      max,
      flag_max,
      min,
      flag_min,
      prcp,
      flag_prcp,
      sndp,
      fog,
      rain_drizzle,
      snow_ice_pellets,
      hail,
      thunder,
      tornado_funnel_cloud
    ]
  }
}
