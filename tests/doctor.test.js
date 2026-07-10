const cds = require('@sap/cds')
const { GET, POST } = cds.test(__dirname + '/..')

const doctorAuth = { auth: { username: 'admin', password: 'doctor1' } }

describe('DoctorService', () => {

  test('Doctor can read patients', async () => {
    const response = await GET('/odata/v4/doctor/Patients', doctorAuth)

    expect(response.status).toBe(200)
    expect(response.data.value.length).toBeGreaterThan(0)
  })

  test('Doctor can create diagnosis', async () => {
    const response = await POST('/odata/v4/doctor/Diagnoses', {
      patient_ID: '11111111-1111-1111-1111-111111111111',
      doctor_ID: 'aaaaaaaa-1111-1111-1111-111111111111',
      title: 'Common Cold'
    }, doctorAuth)

    expect(response.status).toBe(201)
    expect(response.data.title).toBe('Common Cold')
    expect(response.data.description).toBe('Diagnosis: Common Cold')
  })

  test('Doctor can read diagnoses', async () => {
    const response = await GET('/odata/v4/doctor/Diagnoses', doctorAuth)

    expect(response.status).toBe(200)
    expect(response.data.value).toBeDefined()
  })

})