sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/healthcare/doctor/doctorui/test/integration/pages/PatientsList.gen",
	"com/healthcare/doctor/doctorui/test/integration/pages/PatientsObjectPage.gen"
], function (JourneyRunner, PatientsListGenerated, PatientsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/healthcare/doctor/doctorui') + '/test/flpSandbox.html#comhealthcaredoctordoctorui-tile',
        pages: {
			onThePatientsListGenerated: PatientsListGenerated,
			onThePatientsObjectPageGenerated: PatientsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

