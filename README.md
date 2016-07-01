#Project 3 - Physical Therapy App

##Scope

####Pitch
Getting injured is tough, and recovery is even tougher.  Traditionally, a patient visting her physical therapy doctor will get assessed then given a list of exercises on paper sheets to take home and rehabilitate between doctor visits.  These lists are often generic and inconvient to use during stretching.

Enter **DigicarePT**, a fine offering from the team that brought you DigicareOBGYN, DigicareRN, and DigicareRehab.

With this application, a doctor can customize treatment for her patients, leading to more effective treatment time and clearer outcomes for the patient.


####Goal
Allow the user and the physician to communicate and interact online. Physician will be able to assign exercises to patients undergoing physical therapy via digital media (pictures/gif, videos, descriptions).

##User Stories

There are two users: patient and doctor.

#####Patient
The patient will be able to log in/sign up,  view the doctors, choose a doctor, view the list of exercises prescribed by the doctor, and view the overall exercise index page
 
#####Doctors
The physician will be able to log in/sign up, to view the patient profile, assign/remove the exercises to the patient

We'll have three models: patients,  doctors and exercises. The patient and exercises are connected by a joint table


##Planning
[Trello] (https://trello.com/b/2hUBMDlJ)

[Schedule/Milestones] (https://docs.google.com/spreadsheets/d/1v_VcVBdGkPDtkP9yZEItrfRznMJE9yYMZdebbxAq5Pc/edit#gid=0)

<details><summary>Entity Relationship Diagram</summary>
![ERD/Model](./planning/ERD.png)
</details>

<details><summary>Wireframes</summary>
![Home](./planning/Home.jpg)
![DoctorSignup](./planning/DoctorSignup.jpg)
![DoctorProfile](./planning/DoctorProfile.jpg)
![PatientProfile](./planning/PatientProfile-DoctorView.jpg)
![ExerciseAssignment](./planning/ExerciseAssignment.jpg)
![ExerciseIndex](./planning/ExerciseIndex.jpg)
![ExerciseShow](./planning/ExerciseShow.jpg)
![PatientSignup](./planning/PatientSignup.jpg)
![PatientProfile](./planning/PatientProfile.jpg)
![DoctorProfile](./planning/DoctorProfile-PatientView.jpg)
![DoctorIndex](./planning/DoctorIndex.jpg)
![About](./planning/About.jpg)
![PatientIndex](./planning/PatientIndex(ICEBOX).jpg)
</details>

##Technologies Used
* Upload-Care / PaperClip
* Friendly-ID
* JS/Jquery for front-end
* AJAX

##Install

It's a web application.  Click and go!  [DigitcarePT](https://physician-patient-app.herokuapp.com/)

##Wish List

Given more time, our team would develop the ability to:

* Allow patient to report progress to the doctor by checking off exercises
* Display patient progress in a chart or [sparkline](https://en.wikipedia.org/wiki/Sparkline)
* View patient, doctor, and exercise pages with friendly URLs
* Allow commenting, chat, or emailing between patient and doctor directly from the app

##Contributors
* [Wayne Banks](https://github.com/Limelight-Management-Group)
* [Sam Brooks](https://github.com/sbrks)
* [Michael Norelli](https://github.com/mnorelli)
* [Ben Yang](https://github.com/byfyang)

#####With generous support from
* Alex White, client and consultant
* The GA TA's, including Nick, Justin, Vikash, and Celeste
* WDI29 developers


