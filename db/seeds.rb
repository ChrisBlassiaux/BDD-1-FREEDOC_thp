# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Specialty.destroy_all
Appointment.destroy_all
JoinTableDoctorSpecialty.destroy_all

Specialty.create(name: "allergologie")
Specialty.create!(name: "andrologie")
Specialty.create!(name: "cardiologie")
Specialty.create!(name: "chirurgie")

50.times do
  City.create!(
    name: Faker::Address.city
  )
 
  Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Number.between(from: 1000, to: 5000), 
    city_id: City.find(rand(City.first.id..City.last.id)).id, 
    speciality: Specialty.find(rand(Specialty.first.id..Specialty.last.id)).id #maybe error here
  )

  JoinTableDoctorSpecialty.create(
    doctor_id: Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id, 
    specialty_id: Specialty.find(rand(Specialty.first.id..Specialty.last.id)).id
  )

  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, 
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )

   Appointment.create!(
    doctor_id: Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id, 
    patient_id: Patient.find(rand(Patient.first.id..Patient.last.id)).id,
    date: Faker::Date.between(from: Date.today, to: 1.year.from_now), 
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

