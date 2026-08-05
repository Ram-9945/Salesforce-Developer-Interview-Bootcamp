Id studentId = 'a05fj00000KFAuoAAH';   // Roy
Id jobId = 'a06fj00000ItfkvAAB';       // Salesforce Developer

Boolean isDuplicate =
    ApplicationValidationService.checkDuplicate(studentId, jobId);

System.debug('Duplicate Status : ' + isDuplicate);