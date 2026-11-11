This page describes the resources in a request and fulfilment workflow and how they reference each other. It follows COW [Core Concepts](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/core-concepts.html) and [Requests, Events, and Tasks](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/requests-events-tasks.html).

### Actors and resources

* The **placer** creates the request (ServiceRequest, MedicationRequest, ...). The request is the authorization to perform the work.
* The **fulfiller** performs the work and records the outcome as events (Procedure, Observation, MedicationDispense, ...).
* A **Coordination Task** tracks the work between one placer and one (potential) fulfiller. It follows the COW [Coordination Task](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/StructureDefinition-coordination-task.html) profile.

There is a Coordination Task for each placer and (potential) fulfiller pair. Communication about the work is centred on the Task, not on the request.

### References from the Task

| Element | Contents |
|---|---|
| `Task.focus` | The request being fulfilled. |
| `Task.basedOn` | A higher-level authorization, such as a CarePlan or another request. The request being fulfilled is referenced in `Task.focus`, not in `Task.basedOn`. |
| `Task.partOf` | For a sub-task, the Coordination Task it belongs to. |
| `Task.owner` | The party that currently has the baton. |
| `Task.performer` | Parties that have been involved before. |
| `Task.input` | What the fulfiller needs to know to perform the work. Why the work is authorized goes in the request's `supportingInfo`. |
| `Task.output` | The events produced, referenced where they are hosted by their creator. |

Tasks without a request are allowed.

### Parent Tasks and sub-tasks

When several fulfillers each produce part of the outcome, the placer may create a parent Coordination Task that it owns and that only it may modify.

Sub-tasks SHOULD refer back to the Coordination Task through `Task.partOf`. The overall status is read from the Coordination Task, and the events produced are linked in its `Task.output`. See COW [Managing sub-tasks in a workflow](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/requests-events-tasks.html#mangaging-sub-tasks-in-a-workflow).

For the Tasks that track a group of requests, see [Grouping Requests](grouping.html#tracking-a-group).

### Choosing the fulfiller

The fulfiller is assigned by the placer, accepts the request, is chosen by the patient, bids for the work, or is assigned by a central coordinator. Each case follows COW [Fulfiller Determination](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/fulfiller-determination.html). With several potential fulfillers, there is a separate Task per potential fulfiller.

### Additional information

When the fulfiller needs more information, it queries the placer directly, sends a letter or Communication, or creates a Task back to the placer. These follow COW [Fulfiller Need for Additional Information](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/fulfiller-need-for-additional-info.html). Fulfillers SHOULD state that they are awaiting information with `Task.businessStatus`.
