view: view_example1 {
  derived_table: {
    create_process: {
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} (
                         orderid nvarchar(100),category nvarchar(100),

                        sales int

                       ) ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME}(orderid,category,sales)
                        SELECT orderid,category,sales
                         FROM orderbreakdown ;;
    }
  }
#    filter:  {}
 parameter: sp_param {
   type: string
  #add other parameters
 }
}
