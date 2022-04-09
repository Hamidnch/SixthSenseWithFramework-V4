<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAvatarUpload.aspx.cs" Inherits="UserPanel_UserAvatarUpload"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>آپلود تصویر کاربر در سایت حس ششم</title>
    <link href="../Styles/CSSUserAvatarDefault.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSUserAvatarUploadify.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSUserProfile.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.uploadify.v2.1.0.min.js" type="text/javascript"></script>
    <script src="../Scripts/swfobject.js" type="text/javascript"></script>
</head>
<body style='background:black;'>
    <div id='main'>
        <form id="form1" runat="server">
		    <br/>
            <div class="demo">
                <asp:FileUpload ID="myUploader" runat="server" />
                <div id="container"></div>       
                <asp:Image ID="imgUser" CssClass="shadow" runat="server" ImageUrl="~/UserPanel/UserImgUpload/NoPhoto.jpg"/>
            </div>
            <hr />
            <div style="float:right"><input type="button" class="btn" value="برگشت" onclick="javascript:window.location.href='UserProfileRegister.aspx'"/></div>            
        </form>
    </div>
</body>
</html>
<script type = "text/javascript">
    $(document).ready(function ()
    {    
        function getUserName() { return '<%= GetUserName %>'; } var userName = getUserName();
        function getExtension(filename){return (/[.]/.exec(filename)) ? /[^.]+$/.exec(filename) : undefined;}

        function getRootPath() { return '<%= Root %>'; } var rootPath = getRootPath();
        $("#<%=myUploader.ClientID%>").uploadify({
            'uploader': rootPath + 'Scripts/uploadify.swf',
            'script': rootPath + 'Upload.ashx',
            'cancelImg': rootPath + 'Images/cancel.png',
            'folder': rootPath + 'UserPanel/UserImgUpload',
            'buttonText': 'Browse...',
            'width': 150,
            'height': 50,
            'auto': true,
            'sizeLimit': 102400,
            'wmode': 'transparent',
            'scriptData': { 'currentUser': userName },
            'fileExt': '*.jpg;*.gif;*.png',
            'fileDesc': 'Image Files (.JPG, .GIF, .PNG)',
            'onComplete': function (event, ID, fileObj, response, data)
            {
                $("#img1").remove();
                $("img[id$='imgUser']").hide();    
                $("#container").append("<img class='shadow' id='img1' name='img1' src='" + response + "'/>");
                // var _imgprev = $(document.createElement('img')).attr('id', 'preview').attr('src', response);
                //var newResponse = response + '?' + (new Date()).getTime();
                //var index = response.indexOf('_');
                //var start = response.substr(0, index);
                //var ext = getExtension(response);
                //var res = newResponse.substr(0, index);
                //var result = start + "." + ext; alert(response); alert(fileObj.name);
                //alert(response);
                //alert(newResponse);
                //alert(res);
                // $('#container').append(_imgprev);
                // alert('There are ' + data.fileCount + ' files remaining in the queue.');                
                //$('#imgUser').attr('src', "../UserPanel/UserImgUpload/" + fileObj.name); //fileObj['name']
                // var ext = getExtension(fileObj['name']);
                //  $('#<=imgUser.ClientID %>').attr('src', "../UserPanel/UserImgUpload/" + userName + "." + ext); //fileObj['name']
                //$("img[id$='imgUser']").attr("src", "");
                // alert(rootPath + "UserPanel/UserImgUpload/" + userName + "." + ext);
                //$("img[id$='imgUser']").attr("src", response);                
                //alert(response);                
                //$("img[id$='imgUser']").show().delay(5000).fadeIn(1500);
            },
            onError: function (a, b, c, d)
            {
                if (d.status == 404) alert('Could not find upload script.');
                else if (d.type === "HTTP") alert('error ' + d.type + ": " + d.status);
                else if (d.type === "File Size") alert(c.name + ' ' + d.type + ' Limit: ' + Math.round(d.sizeLimit / 1024) + 'KB');
                else alert('error ' + d.type + ": " + d.text);
            }
            //'buttonImg': '../Images/cancel.png',
            //'multi': true,
            //vmode ='opaque' / 'transparent'   
            //'queueID': 'custom-queue',
            //'queueSizeLimit': 3,
            //'simUploadLimit': 3,
            //'removeCompleted': false,
            //'checkScript': 'uploadify/check.php',
            //'displayData': 'speed',
        });
    });
</script>
