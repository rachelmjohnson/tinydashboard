connection: "druid1k"

include: "druid.*.view.lkml"         # include all views in this project
#include: "*.dashboard.lookml"  # include all dashboards in this project

explore: orders {}
