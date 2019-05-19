var socket = new WebSocket("ws://192.168.100.9:8080/cat/index");
socket.onopen = function () {
    console.log("WebSocket,建立连接成功")
};
socket.onclose = function (event) {
    console.log("WebSocket,已关闭")
};
socket.onerror = function (event) {
    console.log("WebSocket,异常")
};
socket.onmessage = socket_onmessage;
socket["sendJson"] = function (param) {
    socket.send(JSON.stringify(param));
   /* if (socket.readyState===1) {
        socket.send(JSON.stringify(param));
    }else{
        console.log("socketnotOk"+socket.readyState);
    }*/

};