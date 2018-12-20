<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>挖掘机</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-105150423-3"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', 'UA-105150423-3');
    </script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/neo4jd3.min.css?v=0.0.1">
    <style>
        body,
        html,
        .neo4jd3 {
            height: 100%;
            overflow: hidden;
        }
        path.outline {
            fill: none;
            stroke: #666;
            stroke-width: 1.5px;
        }
    </style>
</head>

<body>
    <div id="neo4jd3"></div>
    <div id="webchat"></div>
    <script src="js/d3.min.js"></script>
    <script src="js/neo4jd3.js?v=0.0.1"></script>
    <script src="https://cdn.bootcss.com/socket.io/2.2.0/socket.io.js"></script>
    <script type="text/javascript">

        var data;
        function init() {
            var neo4jd3 = new Neo4jd3('#neo4jd3', {
                highlight: [
                    {
                        class: 'Project',
                        property: 'name',
                        value: 'neo4jd3'
                    }, {
                        class: 'User',
                        property: 'userId',
                        value: 'eisman'
                    }
                ],
                minCollision: 60,
                neo4jData: data,
                nodeRadius: 25,
                zoomFit: true
            });
        }
        window.onload = init;
        var socket = io('http://localhost:8080/');
        socket.on('connect', function () {
          socket.send('hi');
          socket.on('reply', function (msg) {
            console.log(1111);
            // data = eval(msg);
            console.log(msg);
            init();
          });
        });
    </script>
    <script src="webchat.js"></script>
    <script>
        WebChat.default.init({
            selector: "#webchat",
            initPayload: "你好",
            interval: 1000, // 1000 ms between each message
            customData: { "userId": "1" }, // arbitrary custom data. Stay minimal as this will be added to the socket
            socketUrl: "{{ server_url }}",
            title: "智障机器人的日常",
            subtitle: "🐩",
            profileAvatar: "robotic.png",
            showCloseButton: true,
            fullScreenMode: false
        })
    </script>
</body>

</html>