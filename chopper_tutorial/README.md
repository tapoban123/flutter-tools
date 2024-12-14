# Chopper Package Tutorial 
[Chopper Docs](https://hadrien-lejard.gitbook.io/chopper)

We are going to use this free api for learning Chopper. [Here](https://jsonplaceholder.typicode.com/)
<br>

## Here's what I learnt:

- ### How we can use Headers in our API call?

    ```dart
    @Get(headers: {"Content-Type": "text/plain",})
    Future<Response> getPosts(@Header('header-name') String headerValue);
    ```

    We put the headers in the annotation when we have unchangeable headers such as Content-Type.
    We can put the headers as our function parameters when we need to change the headers.

- ### How to trigger code generation using chopper? 
    We need to use the following command:

    ```powershell
    flutter packages pub run build_runner watch/build [DEPRECATED]

    dart run build_runner watch --delete-conflicting-outputs
    ```
- ### Annotations in Chopper
    We use the following annotations for the respective purposes:
    - Query Annotation:
        ```dart
        @Query -> "Used to declare query parameters."

        // Example: 
        @Get(path: '/comments') // https://jsonplaceholder.typicode.com/comments?postId=3
        Future<Response> fetch({@Query('postId') String postId});
        ```
    
    - Path Annotation:
        ```dart
        @Path -> "Used to declare Path parameters."

        // Example:
        @Get(path: '/{param}') // https://jsonplaceholder.typicode.com/posts/1
        Future<Response> fetch(@Path() String param);
        ```

    - Body Annotation
        ```dart
        @Body -> "Used to declare the body of the request."

        // Example:
        @Post(path: '/create-post')
        Future<Response> createNewPost(@Body() BodyModel request);
        ```

