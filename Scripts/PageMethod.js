// --------------------------------------------------------------------------------------------------------------------
// <copyright file="PageMethod.js" company="www.devzone.ir">
// Copyright (C) 2010 Kamyar Paykhan 
// http://www.devzone.ir
// 
// This program is free software; you can redistribute it and/or
// modify it, UNDER THE FOLLOWING CONDITION:
// For any reuse or distribution, you must make clear to others
// the license terms and the original author of this work.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
//
// </copyright>
// <summary>
//   The PageMethod jQuery Plugin.
//   The number of parameters you pass to a page method has to be equal to the number
//   of parameters accepted by your page method. parameter names should be the same 
//   in client side and server side. this means has to define the same name for your 
//   web method's patameter as the name of the parameter you have passed to the method.
//   Also, you cannot define another parameter in your code behind unless you pass a value
//   for it from your js.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

jQuery.PageMethod = function (fn, successFn, errorFn) {
    
    // Initialize the page path. (Current page if we have the 
    // pagepath in the pathname, or "default.aspx" as default.
    var pagePath = window.location.pathname;
    if ( pagePath.lastIndexOf('/') == pagePath.length-1 )
    {
        pagePath = pagePath + "default.aspx";
    }
    
    // Check to see if we have any parameter list to pass to web method. 
    // if so, serialize them in the JSON format: {"paramName1":"paramValue1","paramName2":"paramValue2"} 
    var jsonParams = '';
    var paramLength = arguments.length;
    if (paramLength > 3) {
        for (var i = 3; i < paramLength - 1; i += 2) {
            if (jsonParams.length != 0) jsonParams += ',';
                jsonParams += '"' + arguments[i] + '":"' + arguments[i + 1] + '"';
        }
    }
    jsonParams = '{' + jsonParams + '}';
    return jQuery.PageMethodToPage( pagePath, fn, successFn, errorFn, jsonParams);
};

jQuery.PageMethodToPage = function (pagePath, fn, successFn, errorFn, jsonParams) {
    
    //Call the page method 
    $.ajax({
        type: "POST",
        url: pagePath + "/" + fn,
        contentType: "application/json; charset=utf-8",
        data: jsonParams,
        dataType: "json",
        success: successFn,
        error: errorFn
    });
};