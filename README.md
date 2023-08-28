# README

[Database Schema](https://erd.dbdesigner.net/designer/schema/1692638780-farmer-s-market)

## Iteration 1
CRUD

```
[x] done

User Story 1, hospital Index 

For each hospital table
As a visitor
When I visit '/hospitals'
Then I see the name of each hospital record in the system
```
```
[x] done

User Story 2, hospital Show 

As a visitor
When I visit '/hospitals/:id'
Then I see the hospital with that id including the hospital's attributes
(data from each column that is on the hospital table)
```
```
[x] done

User Story 3, patient Index 

As a visitor
When I visit '/patient_table_name'
Then I see each patient in the system including the patient's attributes
(data from each column that is on the patient table)
```
```
[x] done

User Story 4, patient Show 

As a visitor
When I visit '/patient_table_name/:id'
Then I see the patient with that id including the patient's attributes
(data from each column that is on the patient table)
```
```
[x] done
User Story 5, hospital patientren Index 

As a visitor
When I visit '/hospitals/:hospital_id/patient_table_name'
Then I see each patient that is associated with that hospital with each patient's attributes
(data from each column that is on the patient table)
ActiveRecord
```
```
[x] done

User Story 6, hospital Index sorted by Most Recently Created 

As a visitor
When I visit the hospital index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created
```
```
[x] done

User Story 7, hospital patient Count

As a visitor
When I visit a hospital's show page
I see a count of the number of patientren associated with this hospital
Usability
```
```
[x] done

User Story 8, patient Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the patient Index
```
```
[x] done

User Story 9, hospital Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the hospital Index
```
```
[x] done

User Story 10, hospital patient Index Link

As a visitor
When I visit a hospital show page ('/hospitals/:id')
Then I see a link to take me to that hospital's `patient_table_name` page ('/hospitals/:id/patient_table_name')
```
## Iteration 2
CRUD
```
[x] done

User Story 11, hospital Creation 

As a visitor
When I visit the hospital Index page
Then I see a link to create a new hospital record, "New hospital"
When I click this link
Then I am taken to '/hospitals/new' where I  see a form for a new hospital record
When I fill out the form with a new hospital's attributes:
And I click the button "Create hospital" to submit the form
Then a `POST` request is sent to the '/hospitals' route,
a new hospital record is created,
and I am redirected to the hospital Index page where I see the new hospital displayed.
```
```
[x] done

User Story 12, hospital Update 

As a visitor
When I visit a hospital show page
Then I see a link to update the hospital "Update hospital"
When I click the link "Update hospital"
Then I am taken to '/hospitals/:id/edit' where I  see a form to edit the hospital's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/hospitals/:id',
the hospital's info is updated,
and I am redirected to the hospital's Show page where I see the hospital's updated info
```
```
[x] done

User Story 13, hospital patient Creation 

As a visitor
When I visit a hospital patientren Index page
Then I see a link to add a new adoptable patient for that hospital "Create patient"
When I click the link
I am taken to '/hospitals/:hospital_id/patient_table_name/new' where I see a form to add a new adoptable patient
When I fill in the form with the patient's attributes:
And I click the button "Create patient"
Then a `POST` request is sent to '/hospitals/:hospital_id/patient_table_name',
a new patient object/row is created for that hospital,
and I am redirected to the hospital patients Index page where I can see the new patient listed
```
```
[x] done

User Story 14, patient Update 

As a visitor
When I visit a patient Show page
Then I see a link to update that patient "Update patient"
When I click the link
I am taken to '/patient_table_name/:id/edit' where I see a form to edit the patient's attributes:
When I click the button to submit the form "Update patient"
Then a `PATCH` request is sent to '/patient_table_name/:id',
the patient's data is updated,
and I am redirected to the patient Show page where I see the patient's updated information
ActiveRecord
```
```
[x] done

User Story 15, patient Index only shows `true` Records 

As a visitor
When I visit the patient index
Then I only see records where the boolean column is `true`
```
```
[ ] done

User Story 16, Sort hospital's patientren in Alphabetical Order by name 

As a visitor
When I visit the hospital's patientren Index Page
Then I see a link to sort patientren in alphabetical order
When I click on the link
I'm taken back to the hospital's patientren Index Page where I see all of the hospital's patientren in alphabetical order
Usability
```
```
[x] done

User Story 17, hospital Update From hospital Index Page 

As a visitor
When I visit the hospital index page
Next to every hospital, I see a link to edit that hospital's info
When I click the link
I should be taken to that hospital's edit page where I can update its information just like in User Story 12
```
```
[x] done

User Story 18, patient Update From patients Index Page 

As a visitor
When I visit the `patient_table_name` index page or a hospital `patient_table_name` index page
Next to every patient, I see a link to edit that patient's info
When I click the link
I should be taken to that `patient_table_name` edit page where I can update its information just like in User Story 14
```
## Iteration 3
CRUD

```
[x] done

User Story 19, hospital Delete 

As a visitor
When I visit a hospital show page
Then I see a link to delete the hospital
When I click the link "Delete hospital"
Then a 'DELETE' request is sent to '/hospitals/:id',
the hospital is deleted, and all patient records are deleted
and I am redirected to the hospital index page where I no longer see this hospital
```
```
[x] done

User Story 20, patient Delete 

As a visitor
When I visit a patient show page
Then I see a link to delete the patient "Delete patient"
When I click the link
Then a 'DELETE' request is sent to '/patient_table_name/:id',
the patient is deleted,
and I am redirected to the patient index page where I no longer see this patient
ActiveRecord
```
```
[x] done

User Story 21, Display Records Over a Given Threshold 

As a visitor
When I visit the hospital's patientren Index Page
I see a form that allows me to input a number value
When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
Then I am brought back to the current index page with only the records that meet that threshold shown.
Usability
```
```
[x] done

User Story 22, hospital Delete From hospital Index Page 

As a visitor
When I visit the hospital index page
Next to every hospital, I see a link to delete that hospital
When I click the link
I am returned to the hospital Index Page where I no longer see that hospital
```
```
[x] done

User Story 23, patient Delete From patients Index Page 

As a visitor
When I visit the `patient_table_name` index page or a hospital `patient_table_name` index page
Next to every patient, I see a link to delete that patient
When I click the link
I should be taken to the `patient_table_name` index page where I no longer see that patient
```
## Extensions
```
[ ] done

Extension 1: Sort hospitals by Number of patientren 

As a visitor
When I visit the hospitals Index Page
Then I see a link to sort hospitals by the number of `patient_table_name` they have
When I click on the link
I'm taken back to the hospital Index Page where I see all of the hospitals in order of their count of `patient_table_name` (highest to lowest) And, I see the number of patientren next to each hospital name
```
```
[ ] done

Extension 2: Search by name (exact match)

As a visitor
When I visit an index page ('/hospitals') or ('/patient_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an exact match of one or more of my records and press the Search button
Then I only see records that are an exact match returned on the page
```
```
[ ] done

Extension 3: Search by name (partial match)

As a visitor
When I visit an index page ('/hospitals') or ('/patient_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an partial match of one or more of my records and press the Search button
Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.
```
