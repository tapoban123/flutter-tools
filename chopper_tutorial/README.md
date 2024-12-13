# Chopper Package Tutorial 
[Chopper Docs](https://hadrien-lejard.gitbook.io/chopper)

We are going to use this free api for learning Chopper. [Here](https://jsonplaceholder.typicode.com/)
<br>

## Here's what I learnt:

Here's how we can use Headers in our API call:

```dart
@Get(headers: {"Content-Type": "text/plain",})
Future<Response> getPosts(@Header('header-name') String headerValue);
```

We put the headers in the annotation when we have unchangeable headers such as Content-Type.
We can put the headers as our function parameters when we need to change the headers.

To trigger code generation using chopper we need to use the following command:

```bash
flutter packages pub run build_runner watch/build [DEPRECATED]

dart run build_runner watch --delete-conflicting-outputs
```
