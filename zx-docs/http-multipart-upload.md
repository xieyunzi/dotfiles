http request header

    POST /upload?upload_progress_id=12344 HTTP/1.1
    Host: localhost:3000
    Content-Length: 1325
    Origin: http://localhost:3000
    ... other headers ...
    Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryePkpFF7tjBAqx29L

    ------WebKitFormBoundaryePkpFF7tjBAqx29L
    Content-Disposition: form-data; name="MAX_FILE_SIZE"

    100000
    ------WebKitFormBoundaryePkpFF7tjBAqx29L
    Content-Disposition: form-data; name="uploadedfile"; filename="hello.o"
    Content-Type: application/x-object

    ... contents of file goes here ...
    ------WebKitFormBoundaryePkpFF7tjBAqx29L--

ref: http://stackoverflow.com/questions/8659808/how-does-http-file-upload-work
