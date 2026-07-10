const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const { Patients, Doctors, Diagnoses } = this.entities;

    
    this.before(['CREATE', 'UPDATE'], Patients, req => {

        if (req.data.dateOfBirth) {

            const birthDate = new Date(req.data.dateOfBirth);

            if (birthDate > new Date()) {
                req.error(400, 'Date of birth cannot be in the future.');
            }

        }

    });


    this.before('CREATE', Doctors, req => {

        if (!req.data.category) {
            req.data.category = 'THERAPIST';
        }

    });


    this.before(['CREATE', 'UPDATE'], Diagnoses, req => {

        if (!req.data.description && req.data.title) {

            req.data.description =
                `Diagnosis: ${req.data.title}`;

        }

    });

    this.before('UPDATE', Diagnoses, async req => {

        const diagnosis = await SELECT.one
            .from(Diagnoses)
            .where({ ID: req.data.ID });

        if (!diagnosis?.createdAt) return;

        const created = new Date(diagnosis.createdAt);
        const today = new Date();

        const days =
            (today - created) / (1000 * 60 * 60 * 24);

        if (days > 30) {

            req.error(
                400,
                'Diagnosis older than 30 days cannot be modified.'
            );

        }

    });


    this.after('READ', Diagnoses, result => {

        const diagnoses =
            Array.isArray(result) ? result : [result];

        for (const diagnosis of diagnoses) {

            if (
                diagnosis &&
                diagnosis.title &&
                diagnosis.doctor?.lastName
            ) {

                diagnosis.title =
                    `${diagnosis.title} (Dr. ${diagnosis.doctor.lastName})`;

            }

        }

    });

});