if exists (select * from INFORMATION_SCHEMA.ROUTINES where ROUTINE_NAME = 'spDETAILVIEWS_RELATIONSHIPS_UpdateInsight' and ROUTINE_TYPE = 'PROCEDURE')
	Drop Procedure dbo.spDETAILVIEWS_RELATIONSHIPS_UpdateInsight;
GO


/**********************************************************************************************************************
 * Copyright (C) 2005-2022 SplendidCRM Software, Inc. 
 * MIT License
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation 
 * files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
 * modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
 * is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
 * IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *********************************************************************************************************************/
Create Procedure dbo.spDETAILVIEWS_RELATIONSHIPS_UpdateInsight
	( @MODIFIED_USER_ID     uniqueidentifier
	, @DETAIL_NAME          nvarchar(50)
	, @CONTROL_NAME         nvarchar(100)
	, @INSIGHT_LABEL        nvarchar(100)
	, @INSIGHT_VIEW         nvarchar(50)
	, @INSIGHT_OPERATOR     nvarchar(2000)
	)
as
  begin
	set nocount on

	if exists(select * from DETAILVIEWS_RELATIONSHIPS where DETAIL_NAME = @DETAIL_NAME and CONTROL_NAME = @CONTROL_NAME and DELETED = 0) begin -- then	
		-- BEGIN Oracle Exception
			update DETAILVIEWS_RELATIONSHIPS
			   set MODIFIED_USER_ID     = @MODIFIED_USER_ID 
			     , DATE_MODIFIED        =  getdate()        
			     , DATE_MODIFIED_UTC    =  getutcdate()     
			     , INSIGHT_LABEL        = @INSIGHT_LABEL
			     , INSIGHT_VIEW         = @INSIGHT_VIEW
			     , INSIGHT_OPERATOR     = @INSIGHT_OPERATOR
			 where DETAIL_NAME          = @DETAIL_NAME
			   and CONTROL_NAME         = @CONTROL_NAME
			   and DELETED              = 0;
		-- END Oracle Exception
	end -- if;
  end
GO

Grant Execute on dbo.spDETAILVIEWS_RELATIONSHIPS_UpdateInsight to public;
GO

