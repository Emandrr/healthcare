const cds = require('@sap/cds')
const { GET, POST, PATCH } = cds.test(__dirname + '/..')

const patientAuth = { auth: { username: 'alice', password: 'patient1' } }

describe('PatientService', () => {

  test('Patient can read diagnoses', async () => {
    const response = await GET('/odata/v4/patient/Diagnoses', patientAuth)

    expect(response.status).toBe(200)
    expect(response.data.value).toBeDefined()
  })

  test('Patient cannot create diagnosis', async () => {
    try {
      await POST('/odata/v4/patient/Diagnoses', {
        title: 'Test diagnosis',
        description: 'Test'
      }, patientAuth)
      throw new Error('Expected request to be rejected')
    } catch (err) {
      expect([403, 405]).toContain(err.response?.status)
    }
  })

  test('Patient cannot update diagnosis', async () => {
    try {
      await PATCH(
        '/odata/v4/patient/Diagnoses/11111111-1111-1111-1111-111111111111',
        { title: 'Changed' },
        patientAuth
      )
      throw new Error('Expected request to be rejected')
    } catch (err) {
      expect([403, 404, 405]).toContain(err.response?.status)
    }
  })

})