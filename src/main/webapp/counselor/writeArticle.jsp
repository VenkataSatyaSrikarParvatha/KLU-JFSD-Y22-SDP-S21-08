<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write Article</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], textarea, input[type="file"] {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        textarea {
            height: 150px;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Write an Article</h1>
        <form action="/counselor/submitArticle" method="post" enctype="multipart/form-data">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>

            <label for="context">Context:</label>
            <input type="text" id="context" name="context" required>

            <label for="content">Content:</label>
            <textarea id="content" name="content" required></textarea>

            <label for="image">Attach Image (optional):</label>
            <input type="file" id="image" name="image" accept="image/*">

            <label>
                <input type="checkbox" name="anonymous">
                Post as Anonymous
            </label>

            <button type="submit">Submit Article</button>
        </form>
    </div>
</body>
</html>
