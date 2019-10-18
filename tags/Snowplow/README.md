# Snowplow Analytics

Templates for Google Tag Manager to make working with [Snowplow Analytics](https://github.com/snowplow/snowplow) easier. Add Snowplow to a page, track structured or self-describing events and work with self-describing JSON schema's all without having to touch any code.

## Author

Matt Mathias ([LinkedIn](https://www.linkedin.com/in/matt-mathias/))

## Release notes

| Date | Notes |
|------|-------|
| 25 September 2019 | Initial Release (v0.9.0) |

## Details

### Snowplow Analytics Tag

Designed to work a lot like the Google Analytics tag provided out of the box by Google Tag Manager.

1. **Initialize** the tracker script.
2. Track a **Page View**.
3. Track a **Structured Event**
4. Track a **Self-describing Events**
5. Supports **Global Contexts**
6. Supports **Event Contexts**
7. __Requires__ a *Snowplow Settings* variable

>NOTE: You will have edit the permisions of this template to allow it to access the global variable(s) for your tracker name(s) if they are not already on in the permissions list that is hard coded. The required keys are *{tracker-name}*, *{tracker-name}.q*, *{tracker-name}.q.push*

### Snowplow Settings Variable

Works in a manner consistent with the Google Analytics Settings variables provided by Google Tag Manager out of the box. Allows for setting **most** of the Snowplow Analytics configuration settings in an easy to use interface. Required by the Snowplow Analytics tag.

### Snowplow Context Variable

Create self-describing JSON schemas for use as additional contexts, or self-describing events with Snowplow Analytics. Allows you to define to vendor, schema name, version, and properties of the schema without having to touch any JavaScript.
