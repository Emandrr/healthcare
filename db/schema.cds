using { cuid, managed } from '@sap/cds/common';

namespace healthcare;

entity Patient : cuid, managed {
    @assert.unique: { userIdUnique: [userId] }
    userId      : String(100);
    firstName   : String(100);
    lastName    : String(100);
    dateOfBirth : Date;


    diagnoses   : Composition of many Diagnosis
        on diagnoses.patient = $self;
}

entity Doctor : cuid, managed {
    userId    : String(100);
    firstName : String(100);
    lastName  : String(100);
    category  : DoctorCategory;

    diagnoses : Association to many Diagnosis
        on diagnoses.doctor = $self;
}

type DoctorCategory : String(100) enum {
    therapist    = 'THERAPIST';
    surgeon      = 'SURGEON';
    cardiologist = 'CARDIOLOGIST';
    neurologist  = 'NEUROLOGIST';
    pediatrician = 'PEDIATRICIAN';
    dentist      = 'DENTIST';
}

entity Diagnosis : cuid, managed {
    patient       : Association to Patient;
    doctor        : Association to Doctor;

    title         : String(100);
    description   : LargeString;

    prescriptions : Composition of many Prescription
        on prescriptions.diagnosis = $self;
}

entity Prescription : cuid, managed {
    diagnosis   : Association to Diagnosis;
    title       : String(100);
    description : LargeString;
}