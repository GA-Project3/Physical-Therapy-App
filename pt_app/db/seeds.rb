# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PatientExercise.destroy_all
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
    image_url:"https://ucarecdn.com/a1272143-9cdf-49c3-9b9a-9e953b74d1e7/DefaultUserImage.png"}
  ])


patients[0].doctor = doctors[0]
patients[1].doctor = doctors[1]
patients[2].doctor = doctors[0]
patients[3].doctor = doctors[2]

patients.each do |p|
  p.save
end

exercises = Exercise.create([
  {title:"Outward Rotation (neutral)",body_part:"arm",
    description:"Bend the elbow of your affected arm.  Place a folded towel between that elbow and your side. Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.",
    image_url:"https://www.youtube.com/embed/BJbkZ5RBIM8"},
  {title:"Heal slides",body_part:"leg",
    description:"In a sitting or lying position, bend your knee as far as possible sliding your heel up. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with.",
    image_url:"https://youtu.be/qr4HvF9y5xU?t=11s"},
  {title:"Short arc knee straightening",body_part:"leg",
    description:"Lie on your back with a large towel roll under your knee.  Tighten your thigh muscles and morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.",
    image_url:"http://www2.nau.edu/~mtl8/images/ther_ex_pics/Exercise_Pics/Pics_for_Basic_skills/LE/SAQ.jpg"},
  {title:"Lateral Raise",body_part:"shoulder",
    description:"Stand with your arm at side and palm facing forward.  Set your shoulder blade keeping your elbow the quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz.",
    image_url:"http://www.epainassist.com/images/Article-Images/clasping-hands.gif"},
  {title:"Top leg lifts",body_part:"hip",
    description:"Lie on your unaffected side with your top leg straight.  Bend your bottom leg to help keep you balanced.  But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain.",
    image_url:"http://www.edges.co.kr/wp-content/uploads/2014/08/tumblr_mf05j4WR9M1qidbb0o1_250.gif"},
  {title:"Wall slide forward raise",body_part:"shoulder",
    description:"Stand facing a wall.  Place your hands or sides of both your pinky fingers against the wall.  The European languages are members of the same family. Their separate existence is a myth. For science.",
    image_url:"http://www.queenstownhealth.com/wp-content/uploads/2015/04/scap32.gif"}
  ])

patients[0].exercises << exercises[0]
patients[0].exercises << exercises[1]
patients[1].exercises << exercises[2]
patients[2].exercises << exercises[3]
patients[2].exercises << exercises[4]
patients[3].exercises << exercises[5]
