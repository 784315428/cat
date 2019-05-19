<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/cat/css/index.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>测试网页视频聊天</title></head>
<body style="overflow-y:auto;"><label style="color: #FFFFFF;">个人编号［<label id="identity"></label>］</label>
<div style="position:absolute;top: 160px;left: 345px;width: 650px;">
    <ul id="query-tabs" class="nav nav-tabs">
        <li><a href="#friend" data-toggle="tab"><i class="glyphicon glyphicon-user"></i> 个人</a></li>
        <li><a href="#home" data-toggle="tab"><i class="glyphicon glyphicon-home"></i> 群组</a></li>
    </ul>
    <div class="tab-content" style="margin-top: 1px;">
        <div class="tab-pane fade" id="friend" style="position:relative;height: 100%;width: 100%;">
            <div class="input-group"><input type="text" class="form-control" id="personalId" placeholder="请输入需要搜索的个人编号">
                <span class="input-group-addon" id="findPersonalId"><img src="/cat/img/ok.png" width="20px;"></span>
            </div>
        </div>
        <div class="tab-pane fade" id="home" style="position:relative;height: 100%;width: 100%;">
            <div class="input-group"><input type="text" class="form-control" placeholder="请输入需要搜索的群组编号"> <span
                    class="input-group-addon"><img src="/cat/img/ok.png" width="20px;"></span></div>
        </div>
    </div>
</div>
<div class="modal fade" id="queryShow" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">搜索结果</h4></div>
            <div class="modal-body" align="center"><label name="show"></label></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" name="close" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success btn-sm" name="ready" data-ready="false">对话准备</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="answerShow" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h4 class="modal-title">请求提示</h4></div>
            <div class="modal-body" align="center"><label name="show"></label></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" name="close">拒绝</button>
                <button type="button" class="btn btn-success btn-sm" name="ready" data-ready="false">对话准备</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="dialogForOne" data-backdrop="false" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 904px;">
        <div class="modal-content">
            <div class="modal-header"><h4 class="modal-title">你正在与［<label name="name"></label>］对话</h4></div>
            <div class="modal-body" style="margin: 0px;padding: 0px;">
                <div style="height: 647px;">
                    <div style="width: 600px;height: 647px;float: left;">
                        <div style="overflow-y:auto;height: 500px;">
                            <ul class="bubbleDiv" name="bubbleDiv"></ul>
                        </div>
                        <div style="height: 166px;">
                            <div style="height: 16px;">
                                <div style="margin-left: 5px;"><label for="fileMsg"> <span><i
                                        class="glyphicon glyphicon-link"></i></span> </label>
                                    <form><input type="file" id="fileMsg" style="position:absolute;clip:rect(0 0 0 0);">
                                    </form>
                                </div>
                            </div>
                            <div style="height: 131px;width: 100%;"><textarea id="message"
                                                                              style="width: 100%;height: 100%;resize:none;border: 0px;background-color: #EEEEEE;"
                                                                              placeholder="请输入需要发送的内容"></textarea></div>
                        </div>
                    </div>
                    <div style="width: 300px;height: 647px;float: left;">
                        <div class="panel panel-default" style="margin: 0px;padding: 0px;">
                            <div class="panel-body">
                                <video style="height:250px;width:250px;margin: 0px;padding: 0px;" id="video"
                                       autoplay></video>
                            </div>
                            <div class="panel-footer" align="center">
                                <button type="button" class="btn btn-default btn-lg btn-xs" id="openVideo"
                                        data-use="false"><i
                                        class="glyphicon glyphicon-facetime-video"></i><span>开始视频</span></button>
                                <button type="button" class="btn btn-default btn-lg btn-xs" id="openAudio"
                                        data-use="false"><i class="glyphicon glyphicon-earphone"></i><span>开始语音</span>
                                </button>
                            </div>
                        </div>
                        <div class="panel panel-default" style="margin: 0px;padding: 0px;">
                            <div class="panel-body">
                                <video style="height:250px;width:250px;" id="remote" autoplay></video>
                            </div>
                            <div class="panel-footer" align="center"> 好友视频展示</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" name="close">关闭对话</button>
                <button type="button" class="btn btn-success" onclick="sendMsg()">发送消息</button>
            </div>
        </div>
    </div>
</div>
<script src="/cat/js/index1.js"></script>
<script src="/cat/js/index2.js"></script>
<script src="/cat/js/index3.js"></script>
</body>
</html>