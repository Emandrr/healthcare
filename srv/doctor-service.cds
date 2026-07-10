using { healthcare } from '../db/schema.cds';

@requires: 'doctor'
service DoctorService {

    @odata.draft.enabled
    entity Patients as projection on healthcare.Patient;

    entity Diagnoses as projection on healthcare.Diagnosis;

    entity Doctors as projection on healthcare.Doctor;

    entity Prescriptions as projection on healthcare.Prescription;

}