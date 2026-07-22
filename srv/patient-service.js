const cds = require('@sap/cds');
module.exports = cds.service.impl(async function () {

    const { Diagnoses } = this.entities;

    this.before('READ', Diagnoses, async (req) => {

        const email = req.user.attr?.email || req.user.email;

        let patient = await SELECT.one
            .from('healthcare.Patient')
            .where({ userId: req.user.id });

        if (!patient && email) {
            patient = await SELECT.one
                .from('healthcare.Patient')
                .where({ userId: email });
        }

        if (!patient) {
            return req.reject(403, 'Patient not found');
        }

        req.query.where([
            { ref: ['patient_ID'] },
            '=',
            { val: patient.ID }
        ]);

    });

});