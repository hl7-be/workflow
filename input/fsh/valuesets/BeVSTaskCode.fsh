ValueSet: BeVSTaskCode
Id: be-vs-taskcode
Title: "BREW Task Code Value Set"
Description: "Task codes for use in `Task.code` in Belgian workflows: the FHIR task-code codes, the COW Task codes, and the Belgian Task codes."
* ^status = #draft
* ^experimental = false
* include codes from system http://hl7.org/fhir/CodeSystem/task-code
* include codes from system http://hl7.org/fhir/uv/cow/CodeSystem/cow-task-code
* include codes from system BeCSTaskCode
