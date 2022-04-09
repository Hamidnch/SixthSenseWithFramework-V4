<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserPictureUpload.ascx.cs" Inherits="UserPanel_UserPictureUpload" %>
    <link href="../Styles/CSSUserAvatarDefault.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSUserAvatarUploadify.css" rel="stylesheet" type="text/css" />
<div id='main'>
		<br/>
        <div class="demo">
            <asp:FileUpload ID="myUploader" runat="server" /><br />
        </div>
        <center><img id="pic" src="UserImgUpload/NoPhoto.jpg" alt="" width="200px" height="200px" /></center>
</div>
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

        function getRootPath() { return '<%= Root %>'; } var rootPath = getRootPath();
        $("#<%=myUploader.ClientID%>").uploadify({
            'uploader': rootPath + 'Scripts/uploadify.swf',
            'script': rootPath + 'Upload.ashx',
            'cancelImg': rootPath + 'Images/cancel.png',
            //'buttonImg': '../Images/cancel.png',
            'folder': rootPath + 'UserPanel/UserImgUpload',
            'buttonText': 'Browse...',
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
            'fileExt': '*.jpg;*.gif;*.png',
            'fileDesc': 'Image Files (.JPG, .GIF, .PNG)',
            'onComplete': function (event, ID, fileObj, response, data)
            {
                 alert('There are ' + data.fileCount + ' files remaining in the queue.');                
                $('#pic').attr('src', rootPath + "UserPanel/UserImgUpload/" + fileObj.name); //fileObj['name']
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