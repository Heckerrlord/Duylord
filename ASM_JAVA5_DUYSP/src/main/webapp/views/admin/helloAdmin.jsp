<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ASM_HUNGLT</title>
    <!-- Nếu sử dụng Bootstrap, thêm đường dẫn tới file CSS của Bootstrap -->
    <style>
        /* Định dạng trang web */

        /* Định dạng trang web */
        .a {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Định dạng văn bản trong trang web */
        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="a">
    <div class="text-center">
        <h1>Hello admin,${sessionScope.currentUser.fullname}</h1>
    </div>
</div>
</body>
</html>