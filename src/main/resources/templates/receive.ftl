<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>receive</title>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/amq_jquery_adapter.js"></script>
    <script type="text/javascript" src="js/amq.js"></script>
    <script>
        $(function () {
            function showInfo(str) {
                var t = $("#show");
                var d = new Date();
                var dt = d + " : ";
                t.append(dt + "<br>" + str + "<br>");
            }
            showInfo("start");

            var amq = org.activemq.Amq;
            amq.init({
                uri: 'amq',
                logging: true,
                timeout: 20
            });

            var myHandler = {
                headers: {
                    "Referer":"channel://amq.test"
                },
                rcvMessage: function(message) {
                    console.log(message);
                    showInfo("received " + message.textContent);
                }
            };

            var destination = "channel://amq.test";
            amq.addListener(1,destination,myHandler.rcvMessage);
            showInfo("listening");
        })
    </script>
</head>
<body>
    <div id="show"></div>
</body>
</html>