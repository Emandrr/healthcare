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
    const patientId = '11111111-1111-1111-1111-111111111111'

    const activePatient = `Patients(ID=${patientId},IsActiveEntity=true)`
    const draftPatient  = `Patients(ID=${patientId},IsActiveEntity=false)`

    await POST(
      `/odata/v4/doctor/${activePatient}/draftEdit`,
      {},
      doctorAuth
    )

    const response = await POST(
      `/odata/v4/doctor/${draftPatient}/diagnoses`,
      {
        doctor_ID: 'aaaaaaaa-1111-1111-1111-111111111111',
        title: 'Common Cold'
      },
      doctorAuth
    )

    expect(response.status).toBe(201)
    expect(response.data.title).toBe('Common Cold')
  })

  test('Doctor can read diagnoses', async () => {
    const response = await GET('/odata/v4/doctor/Diagnoses', doctorAuth)

    expect(response.status).toBe(200)
    expect(response.data.value).toBeDefined()
  })

})