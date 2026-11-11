This page says when [contained resources](https://hl7.org/fhir/R4/references.html#contained) are used in requests and Tasks.

### Rule

A resource is contained only when it has no independent existence apart from the resource that contains it. This is the base FHIR rule. Contained resources:

* cannot be searched, referenced from outside their container, or updated on their own;
* cannot themselves contain resources.

COW adds no rules on contained resources.

### Contained resources are not the norm

Resources that a request or Task refers to are normally separate resources, referenced where they are maintained. Contained resources are used only for content that exists only as part of one request:

| Contained | Not contained |
|---|---|
| The requests of a RequestGroup (see [Grouping Requests](grouping.html#one-request-per-item)) | A Patient, Practitioner, PractitionerRole or Organization that exists on a shared server |
| An anonymised, session-specific Patient resource that is only used in this prescription | Tasks |
| A resource that only a contained request uses, such as a Medication, contained in the RequestGroup | Events produced by the fulfiller (see [Task inputs and outputs](#task-inputs-and-outputs)) |

See [Composing an order](grouping.html#composing-an-order).

### Content sent with a request

Content the fulfiller needs at the time of ordering is sent as entries of one of these Bundles:

* a subscription notification Bundle, for a RESTful exchange with the Task at the placer;
* a message Bundle, for a messaging exchange.

See COW [Sharing inputs at the time of ordering](https://build.fhir.org/ig/HL7/fhir-cow-ig/en/sharing-content.html#sharing-inputs-at-time-of-ordering).

### Task inputs and outputs

Events produced by the fulfiller exist on their own: they are hosted by their creator and referenced in `Task.output` (see [Where Requests and Tasks Live](task-placement.html#outcomes)).
