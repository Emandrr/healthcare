sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/healthcare/patient/patientui/test/integration/pages/DiagnosesList.gen",
	"com/healthcare/patient/patientui/test/integration/pages/DiagnosesObjectPage.gen"
], function (JourneyRunner, DiagnosesListGenerated, DiagnosesObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/healthcare/patient/patientui') + '/test/flpSandbox.html#comhealthcarepatientpatientui-tile',
        pages: {
			onTheDiagnosesListGenerated: DiagnosesListGenerated,
			onTheDiagnosesObjectPageGenerated: DiagnosesObjectPageGenerated
        },
        async: true
    });

    return runner;
});

