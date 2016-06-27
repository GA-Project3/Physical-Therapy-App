# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

doctors = Doctor.create([
  {first_name:"Benicia",last_name:"McManus",email:"bm@kasier.com",location:"Denver, CO",phone:"303-555-1111",password:"password",
    description:"Univeristy of Chicago Medical School, expert in ankle, foot, leg and hip physiology.",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"},
  {first_name:"Jorge",last_name:"Demarco",email:"jorge@doctors.com",location:"Washington, DC",phone:"202-555-2222",password:"password",
    description:"St. Louis University, focus in rotator cuff, scapula, clavicle, and humerus.",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"},
  {first_name:"Condoleeza",last_name:"Washington",email:"cw@thecw.org",location:"San Francisco, CA",phone:"415-555-333",password:"password",
    description:"University of California, San Francisco, specializing in  spine, neck, and back issues.",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"}
    ])
