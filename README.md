# Midwifery
## Application Requirement
  A midwife is associated with either a community clinic or a birthing center (the latter has additional facilities to give birth at the center, unlike the former). The system you build should also keep track of the midwife's name, email, phone number, and practitioner id.
  
  
  Parent(s) sign up for the program through a website. The sign up process involves first submitting the personal information of the mother (name, Quebec health care card identi cation, date of birth, address, phone number, email, current profession) as well as expected time frame for birth (year-month). Optionally, the same personal information of the second parent can also be recorded in the system (which minimally would be their name, date of birth, phone number and profession, the other attributes being optional - but the system should nevertheless be able to store them if provided). For simplicity, we will assume that the second parent is the biological father. Parents who qualify are then invited by their local facility to attend an online information session at some future date and time depending on the availability of such sessions. The information session is hosted by one of the midwives. The system should also record the date and time of the session, its language and the couples (even if it is only one of the parents - we do not distinguish) who registered for it, attended, etc.
From the parents who express interest with the program after the information session, an institution selects some of the couples (due to various reasons that we will not get into the details) and assigns them to a specific midwife for that pregnancy (could be different from the one who did the information session). We also keep track of whether this is the first pregnancy, second pregnancy, etc., (of the couple, not just the mother - this is an over simplification).
The expectation is that the midwife will support the couple throughout the pregnancy and the first couple of months
of postpartum.


  From here on, the midwife sets up regular appointments with the parents, which may be infrequent (like once in a month) in the early months of pregnancy and possibly a couple of times a week or more towards the end of the pregnancy and immediately after giving birth or as needed. The system will have to keep track of these appointments (date and time) and also any associated notes (observations) from the midwife. Make sure each note (even within the same pregnancy) can be uniquely tracked and store the date and time when it was recorded in the system. Multiple notes are possible within an appointment, in which case they would have di erent timestamps.
  
  
  In some of these appointments, the midwife may also either takes any necessary medical test samples (such as blood for testing the iron content in the mother's blood), which they will send to labs or writes a referral for any tests (such as ultrasound) that will have to be conducted at a lab by the parents. The system will have to keep track of these tests such as the type of test (blood iron,  rst trimester ultrasound, etc.), the date the test was prescribed, the date the sample was taken (if applicable), the date the actual lab work was done, as well as the result from the test, and the name, id and the phone number of the technician who conducted the actual lab work. The test results are updated by the technician directly on to the system.
  
  
  In one of the initial appointments, the midwife, upon discussion with the mother, will set a more accurate expectation on the due date based on her last menstrual period. Later, a dating ultrasound test is conducted to do another estimate of the expected due date. If these two dates vary, the midwife upon discussion with the mother will choose one of them as the final estimated due date for the pregnancy. The system must still maintain all of these different dates and information.
At some point in the pregnancy, the mother's blood type information (may or may not be the outcome of one of the tests) is recorded. Father's blood type is also recorded if already known through some medically reliable mechanism (like from a blood donor card).


  Further, at some point, the number of babies and their gender is also determined (through some of the tests, but this information may come from different tests at di erent points in time). At some point, their blood type, date of birth (and time), etc., also would get added. The name of the child may also get included if the parents have already chosen one.
Midway through the pregnancy, a "backup" midwife is also assigned, who can take over if the primary is not available (also helps the primary during the actual birth). This person is capable of doing all the same activities (such as taking samples for tests, notes, etc.) as the primary and will also have some appointments, etc., to help the couple familiarize with the backup midwife as well. Around this time, the decision on the location of birth is also made depending on the couple's preferences and circumstances. The location can be at home or one of the birthing centers (need not be the place where the midwife is working). Community clinics do not have birthing facilities.


  The system should be able to  figure out to which pregnancy/individual a note, test, etc., applies.
The system should also keep track of the basic contact information of the healthcare institutions such as name, phone number, email, address and optionally their website.

## Relational Model
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="/project_er.jpg">
  <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
  <img alt="Relational Model of The Midwifery Application" src="/project_er.jpg">
</picture>
