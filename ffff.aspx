<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ffff.aspx.cs" Inherits="ffff" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>آپلود تصویر کاربر در سایت حس ششم</title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="Styles/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="Scripts/jquery.uploadify.v2.1.0.min.js" type="text/javascript"></script>
    <script src="Scripts/swfobject.js" type="text/javascript"></script>
</head>
<body style='background:black;'>
<div id='main'>
        <form id="form1" runat="server">
			<br/>
            <div class="demo">
                <asp:FileUpload ID="myUploader" runat="server" /><br />
            </div>
            <img id="pic" src="#" alt="" width="100px" height="100px" />
        </form>
</div>
</body>
</html>
<script type = "text/javascript">
    $(document).ready(function ()
    {
        //        function onComplete(file, response)
        //        {
        //            // $("input[name$=_filename]", container).val(file.name);
        //            //alert(file.name);
        //            $('#pic').attr('src', "SaveFile/" + file.name);
        //        }
        //        function onSuccess()
        //        {
        //            alert("Successfull");
        //        }
        //vmode ='opaque' / 'transparent'
        $("#<%=myUploader.ClientID%>").uploadify({
            'uploader': 'Scripts/uploadify.swf',
            'script': 'Upload.ashx',
            'cancelImg': 'Images/cancel.png',
            'folder': 'UserPanel/UserImgUpload',
            'buttonText': 'Upload',
            'width': 150,
            'height': 50,
            // 'multi': true,
            'auto': true,
            'sizeLimit': 102400,
            'wmode': 'transparent',
            //'queueID': 'custom-queue',
            //'queueSizeLimit': 3,
            //'simUploadLimit': 3,
            //'removeCompleted': false,
            //'checkScript': 'uploadify/check.php',
            //'displayData': 'speed',
            //'cancelImg': 'cancel.png',
            //'buttonImg': 'attach.png',

            'fileExt': '*.jpg;*.gif;*.png',
            'fileDesc': 'Image Files (.JPG, .GIF, .PNG)',
            'onComplete': function (event, ID, fileObj, response, data)
            {
                // alert('There are ' + data.fileCount + ' files remaining in the queue.');                
                $('#pic').attr('src', "uploads/" + fileObj.name); //fileObj['name']
            },
            onError: function (a, b, c, d)
            {
                if (d.status == 404)
                    alert('Could not find upload script.');
                else if (d.type === "HTTP")
                    alert('error ' + d.type + ": " + d.status);
                else if (d.type === "File Size")
                    alert(c.name + ' ' + d.type + ' Limit: ' + Math.round(d.sizeLimit / 1024) + 'KB');
                else
                    alert('error ' + d.type + ": " + d.text);
            }
        });
    });

</script>

