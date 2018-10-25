view: json_corelogic {
  derived_table: {
    sql: SELECT
      2763463590 as Clip_Sources_Tree_Templated_Filter_ID,
      "Tax Roll_edit" as Clip_Sources_Tree_Templated_Filter_Source,
      '{"value":"N","score":"0.49"}' as Clip_Sources_Tree_Templated_Filter_Air_Conditioning

      UNION ALL

      SELECT
      2763463590 as Clip_Sources_Tree_Templated_Filter_ID,
      "NCD" as Clip_Sources_Tree_Templated_Filter_Source,
      '{"value":"Y","score":"0.49"}' as Clip_Sources_Tree_Templated_Filter_Air_Conditioning
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: clip_sources_tree_templated_filter_id {
    type: number
    sql: ${TABLE}.Clip_Sources_Tree_Templated_Filter_ID ;;
  }

  dimension: clip_sources_tree_templated_filter_source {
    type: string
    sql: ${TABLE}.Clip_Sources_Tree_Templated_Filter_Source ;;
  }

  dimension: clip_sources_tree_templated_filter_air_conditioning {
    type: string
    sql: ${TABLE}.Clip_Sources_Tree_Templated_Filter_Air_Conditioning ;;
  }

  set: detail {
    fields: [clip_sources_tree_templated_filter_id, clip_sources_tree_templated_filter_source, clip_sources_tree_templated_filter_air_conditioning]
  }
}
