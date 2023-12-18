export class CreatePatientDto {
  firstName: string;
  lastName: string;
  middleName: string;
  birthYear: string;
  birthMonth: string;
  birthDay: string;
  gender: 'Male' | 'Female';
  address: string;
  emailAddress: string;
  phoneNumber: string;
}
