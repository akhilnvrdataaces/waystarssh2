connection: "mysql-server"
label: "akhil-practice"

# include all the views
include: "/views/**/*.view"

datagroup: sql_practice_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sql_practice_default_datagroup

explore: order_lists {
   join: orderbreakdown {
     relationship: many_to_many
     type: inner
     sql_on: ${order_lists.order_id}=${orderbreakdown.order_id} ;;
     sql_where: ${order_lists.country} = "USA" ;;
     }
  }

explore: orderbreakdown {}

explore: salesview {}
