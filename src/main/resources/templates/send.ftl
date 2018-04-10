<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>send</title>
    <#--ActiveMQ ajax -->
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/amq_jquery_adapter.js"></script>
    <script type="text/javascript" src="js/amq.js"></script>
    <script>
        $(function(){
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

            // 发送消息
            $("#btn").click(function () {
                var destination = "channel://amq.test";
                var msgCon = $("#input-text").val();
                amq.sendMessage(destination, msgCon, "amq-msg-type='text'");
                showInfo("send message to queue: " + msgCon);
            });
        })
    </script>
</head>
<body>
    <div>
        <input type = "text" id = "input-text"/>
        <input id="btn" type="button" value="发送消息"/>
    </div>
    <div id="show"></div>
</body>
</html>