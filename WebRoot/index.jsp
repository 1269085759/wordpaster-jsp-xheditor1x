<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ 
	page contentType="text/html;charset=utf-8"%><%@
	page import="org.apache.commons.lang.StringUtils" %><%
/*	
	更新记录：
		2013-01-25 取消对SmartUpload的使用，改用commons-fileupload组件。因为测试发现SmartUpload有内存泄露的问题。
*/
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String clientCookie = request.getHeader("Cookie");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>WordPaster form xheditor 1.x</title>
	<!--<script type="text/javascript" src="jquery/jquery-1.4.4.min.js"></script>-->
    <script type="text/javascript" src="WordPaster/js/json2.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/jquery-1.4.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="xheditor-1.1.13-zh-cn.min.js"></script>
    <link type="text/css" rel="Stylesheet" href="WordPaster/css/WordPaster.css"/>
    <link type="text/css" rel="Stylesheet" href="WordPaster/js/skygqbox.css" />
    <script type="text/javascript" src="WordPaster/js/skygqbox.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/w.edge.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/w.app.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/w.file.js" charset="utf-8"></script>
	<script type="text/javascript" src="WordPaster/js/WordPaster.js" charset="utf-8"></script>
	<style type="text/css">
		.imagepaster{background: transparent url(WordPaster/paster.png) no-repeat; background-position:3px 2px;}
		.netpaster{background: transparent url(WordPaster/ico.png) no-repeat; background-position:3px 2px;}
	</style>
</head>
<body>
	<div style=" font-size:medium; line-height:130%;">
		<p>演示方法：</p>
		<ul style="list-style-type:decimal;">
			<li>打开Word文档，复制多张图片，然后在编辑器中按 Ctrl+V 粘贴，编辑器将自动上传所有图片。</li>
			<li>复制电脑中任意图片文件，然后点击编辑器中的图片粘贴按钮。</li>
			<li>通过QQ或其它软件截屏，复制图片，然后点击编辑器中的图片粘贴按钮。</li>
		</ul>
		<p>相关问题：</p>
		<ul style="list-style-type:decimal;">
			<li>下载exe安装包手动安装后可支持IE/Firefox/Chrome。<a target="_blank" href="http://yunpan.cn/QX4tdHFfHbmV5">exe安装包</a></li>
			<li>如果无法安装控件请下载进行安装<a target="_blank" href="http://www.microsoft.com/downloads/details.aspx?FamilyID=9b2da534-3e03-4391-8a4d-074b9f2bc1bf%20">Microsoft Visual C++ 2008 Redistributable Package (x86)</a></li>
			<li>如果有任何问题或建议请向我们<a target="_blank" href="http://www.ncmem.com/blog/guestbook.asp">反馈</a></li>
		</ul>
	</div>
	<textarea id="txtContent" name="txtContent" rows="12" cols="80" style="width:860px;height:180px;">此示例演示与xhEditor编辑器整合的功能</textarea>
	<script type="text/javascript" language="javascript">
		var editor;
		var pasterMgr = new WordPasterManager();
		pasterMgr.Config["PostUrl"] = "http://localhost:8080/WordPaster2Xheditor1x/upload.jsp";
		pasterMgr.Config["Cookie"] = '<%=clientCookie%>';
		pasterMgr.Load(); //加载控件
		
		$(pageInit);
		function pageInit() {
			var allPlugin = {
				imagepaster: { c: 'imagepaster', t: '粘贴来自Word,剪帖板,QQ截屏的图片', e: function() { pasterMgr.Paste(); } }
				,netpaster: { c: 'netpaster', t: '自动上传远程服务器图片', e: function() { pasterMgr.UploadNetImg(); } }
			};
			editor = $('#txtContent').xheditor({ plugins: allPlugin, tools: 'imagepaster,netpaster,Source,Fullscreen,About' });
			pasterMgr.SetEditor(editor);
		}

	</script>
</body>
</html>