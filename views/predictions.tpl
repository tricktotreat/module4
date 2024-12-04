<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Гороскоп на сегодня</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        const predict_url = "http://localhost:8080";

        function set_content_in_divs(paragraphs) {
            $.each(paragraphs, function(i, d) {
                const p = $("#p-" + i);
                if (p.length > 0) {
                    p.html("<p>" + d + "</p>");
                }
            });
        }

        function fetchPredictions() {
            $.getJSON(predict_url + "/api/predictions", function(data) {
                $("#main-header").text("Что день " + data.date + " готовит");
                set_content_in_divs(data.predictions);
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 id="main-header" onclick="fetchPredictions()">Что день {{ date }} готовит</h1>
        <div class="row">
            <div class="col" id="p-0"></div>
            <div class="col" id="p-1"></div>
        </div>
        <div class="row">
            <div class="col" id="p-2"></div>
            <div class="col" id="p-3"></div>
        </div>
        <div class="row">
            <div class="col" id="p-4"></div>
            <div class="col" id="p-5"></div>
        </div>
    </div>
</body>
</html>
