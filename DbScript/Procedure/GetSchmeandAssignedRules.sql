--select *  from tblschemmaster
-- execute GetSchmeandAssignedRules 'MyShcmemTest'
-- execute GetSchmeandAssignedRules null
IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID('GetSchmeandAssignedRules') 
AND type ='P')
DROP PROCEDURE  GetSchmeandAssignedRules
go
create Procedure [dbo].[GetSchmeandAssignedRules]
(@SchmeId varchar(100) = null ,
 @schemeName varchar(100)  = null,
 @stakeHolderApproveId varchar(100) = null
     )
AS
BEGIN
 --select * from tblschemmaster
		
	select * from tblSchemeSetup where (@SchmeId is null or Schemeid= @SchmeId)
		
	select 	schme.Schemeid,schme.StakeHolderApprovalId, stkApproval.stkTitile, schme.schemeName,
	schme.schmeDescription,	schme.vestOverPeriod,schme.AdjustRemaindoptions,
	schme.vestStart,schme.Vesfrequency,schme.RatioMultipler,
	schme.RatioDivisor,	schme.periodOffset,	schme.LockinPeriodStartfrom,
	schme.ExerciseStartAfter,schme.ADD_USERID,dbo.GetMSODateFormat(schme.ADD_TIMESTAMP),
	assignedRule.SepRuleId,
	RuleDesc.SepReasonCode, RuleDesc.SepReasonName,	assignedRule.Schemeid,
	assignedRule.VestedOptionsLiveTillExercisePeriod,
	assignedRule.VestedOptionLiveFor, assignedRule.UnitIdVestdLiveFor UnitIdVestdLiveFor,
	assignedRule.UnitIdVestdLiveFor,assignedRule.UnvestedLiveFor,
	assignedRule.UnitIdUnvestedLiveFor, 
	assignedRule.LeavethisRule,
	assignedRule.IsVestofUnvestedOptionsOnSepratonDate 	 from tblSchemeSetup schme
	 left outer join 
	 tblRuleAssingedonSeperation assignedRule on assignedRule.Schemeid = schme.Schemeid
	 left outer join   tblSepRuleDesc RuleDesc
	 on assignedRule.SepRuleId =RuleDesc.SepRuleId 
	 left outer join  tblStkHolderApproval stkApproval on   stkApproval.stakeHolderApproveId = schme.StakeHolderApprovalId
	 where (@SchmeId is null or schme.Schemeid=@SchmeId)
	 and  (@stakeHolderApproveId is null or schme.StakeHolderApprovalId = @stakeHolderApproveId)
	 and (@schemeName is null or schme.schemeName =@schemeName)
	 	 
	 		 
END