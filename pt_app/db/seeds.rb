# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Patient_Exercise.destroy_all
Patient.destroy_all
Exercise.destroy_all
Doctor.destroy_all

doctors = Doctor.create([
  {first_name:"Benicia",last_name:"McManus",email:"bm@kaisier.com",location:"Denver, CO",phone:"303-555-1111",password:"password",
    description:"University of Chicago Medical School, expert in ankle, foot, leg and hip physiology.",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"},
  {first_name:"Jorge",last_name:"Demarco",email:"jorge@doctors.com",location:"Washington, DC",phone:"202-555-2222",password:"password",
    description:"St. Louis University, focus in rotator cuff, scapula, clavicle, and humerus.",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"},
  {first_name:"Condoleeza",last_name:"Washington",email:"cw@thecw.org",location:"San Francisco, CA",phone:"415-555-3333",password:"password",
    description:"University of California, San Francisco, specializing in  spine, neck, and back issues.",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"}
    ])

patients = Patient.create([
  {first_name:"Kate",last_name:"Lincoln",email:"kl@gmail.com",location:"Beaverton, CO",phone:"303-555-4444",password:"password",
    diagnosis:"Torn L3 ligament, misaligned clavicle",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"},
  {first_name:"Vinjay",last_name:"Sulman",email:"vinjay@yahoo.com",location:"Alexandria, VA",phone:"703-555-5555",password:"password",
    diagnosis:"Aggravated lower lumbar, hip malaplaysia",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"},
  {first_name:"Leticia",last_name:"Abercrombie",email:"ladyw@hotmal.com",location:"Colorado Springs, CO",phone:"303-555-6666",password:"password",
    diagnosis:"Sciatic crease, irregular spagiotic hemotoma",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"},
  {first_name:"Dan",last_name:"Davis",email:"ddavis@msn.com",location:"Pittsburg, PA",phone:"412-555-7777",password:"password",
    diagnosis:"Torn humeral mass, shattered right tibia",
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"},

  ])

