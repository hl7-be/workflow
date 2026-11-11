This page says where requests and Tasks are kept and who may change them. It follows COW [Core Concepts](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/core-concepts.html#requests-tasks-and-outputs-events) and [Workflow Patterns](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/workflow-patterns.html).

### Requests

* The request SHALL be hosted on a FHIR server under the authority of the system it originated from.
* A request SHALL only ever be directly modified by the party that created it. Other parties relay updates through Tasks (see [Cancelling and Changing Requests](cancel-modify.html)).

### Tasks

Placer and fulfiller agree in advance where their shared Coordination Task is hosted, using one of these set-ups:

| Set-up | How it works | COW |
|---|---|---|
| Task at the fulfiller | The placer creates the Task on the fulfiller's server, and may subscribe to changes. | [Overview](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/workflow-patterns.html#overview-example---coordination-task-at-fulfiller-with-optional-subscriptions) |
| Task at the placer | The placer hosts the Task. The fulfiller is notified through a subscription and updates the Task there. | [Overview](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/workflow-patterns.html#overview-example---subscriptions-with-task-at-placer) |
| Messaging | Placer and fulfiller exchange messages with the Task as `MessageHeader.focus`, relying on shared identifiers. | [Overview](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/workflow-patterns.html#overview-example---messaging) |

A parent Coordination Task created by the placer is owned by the placer and only the placer may modify it.

### Intermediaries and central servers

When an intermediary, such as a regional or federal server, passes content between placer and fulfiller, it rewrites references to point to its own server. See COW [Sharing content when intermediaries are present](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/core-concepts.html#sharing-content-when-intermediaries-are-present).

When a central coordinator chooses the fulfiller, the workflow follows COW [Requests to a central coordinator](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/fulfiller-determination.html#requests-to-a-central-coordinator).

### Outcomes

Events produced by the fulfiller are hosted by their creator and referenced in `Task.output`, wherever the Coordination Task is hosted. See COW [Sharing outcomes of clinical orders](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/sharing-content.html#sharing-outcomes-of-clinical-orders).
