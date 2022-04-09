/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig = function (config)
{
    // Define changes to default configuration here. For example:
    // config.uiColor = '#AADC6E';
    config.language = 'fa';
    config.contentsLangDirection = 'rtl';
    config.font_defaultLabel = 'Tahoma';

    // Define changes to default configuration here. For example:
    //config.uiColor = 'lime'; /*'#AADC6E';*/
    //config.skin = 'office2003';
    //config.enterMode = CKEDITOR.ENTER_BR;
    //config.font_names = 'Tahoma';
    config.resize_enabled = true;
    config.removePlugins = 'elementspath,save,about,source,flash';
//    config.removePlugins = 'flash';
    //config.startupFocus = true;
    config.tabIndex = 4;
    config.toolbarCanCollapse = true;
    //    config.extraPlugins = 'syntaxhighlight';
    //    config.toolbar_Full.push(['Code']);
    config.htmlEncodeOutput = false;

    config.filebrowserImageBrowseUrl = "ckeditor/ImageBrowser.aspx";
    config.filebrowserImageWindowWidth = 780;
    config.filebrowserImageWindowHeight = 720;
    config.filebrowserBrowseUrl = "ckeditor/LinkBrowser.aspx";
    config.filebrowserWindowWidth = 500;
    config.filebrowserWindowHeight = 650;
    config.htmlEncodeOutput = true;
};