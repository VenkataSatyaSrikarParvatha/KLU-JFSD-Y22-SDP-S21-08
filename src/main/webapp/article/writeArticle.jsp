<!DOCTYPE html>
<html>
<head>
    <title>Write Article</title>
</head>
<body>
    <h1>Write an Article</h1>
    <form action="submitArticle" method="post" enctype="multipart/form-data">
        <p>
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" required />
        </p>
        <p>
            <label for="context">Context:</label>
            <input type="text" name="context" id="context" required />
        </p>
        <p>
            <label for="content">Content:</label>
            <textarea name="content" id="content" rows="10" required></textarea>
        </p>
        <p>
            <label for="image">Image (optional):</label>
            <input type="file" name="image" id="image" accept="image/*" />
        </p>
        <p>
            <label>
                <input type="checkbox" name="anonymous" />
                Post as Anonymous
            </label>
        </p>
        <p>
            <button type="submit">Submit</button>
        </p>
    </form>
</body>
</html>
