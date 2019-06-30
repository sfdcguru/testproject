trigger Apex_Test_11 on Lead (after update) {
    Lead_Trigger.callMe(Trigger.new);
}