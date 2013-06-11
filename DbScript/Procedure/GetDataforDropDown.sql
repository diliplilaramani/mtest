GO
/****** Object:  StoredProcedure [dbo].[GetDataforDropDown]    Script Date: 10/09/2012 20:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC GetDataforDropDown  'code','name','tblAdjustResidueList'
CREATE Procedure [dbo].[GetDataforDropDown]
    /* Input Parameters */
    (@valueField NVarchar(100),
    @textField AS NVARCHAR(100),
    @TableName AS NVARCHAR(100) )
AS
BEGIN
DECLARE @SQLQuery NVARCHAR(300);
DECLARE @Select1 NVARCHAR(100);
DECLARE @Select2 NVARCHAR(100);

/* Build and Execute a Transact-SQL String with a single parameter 
value Using sp_executesql Command */
--SET @SQLQuery = 'SELECT' +  @FIELD1 + ',' + @FIELD2  + 'FROM ' +  @TABLENAME


SET @SQLQuery =  ' SELECT ' +  @valueField + ',' + @textField + '  FROM ' + @TableName 
--PRINT @SQLQuery
EXECUTE sp_executesql @SQLQuery
END  