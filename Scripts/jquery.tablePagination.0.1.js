/**
* @name tablePagination
* @type jQuery
* @param Object settings;
*      firstArrow - Image - Pass in an image to replace default image. Default: (new Image()).src="./Images/first.gif"
*      prevArrow - Image - Pass in an image to replace default image. Default: (new Image()).src="./Images/prev.gif"
*      lastArrow - Image - Pass in an image to replace default image. Default: (new Image()).src="./Images/last.gif"
*      nextArrow - Image - Pass in an image to replace default image. Default: (new Image()).src="./Images/next.gif"
*      rowsPerPage - Number - used to determine the starting rows per page. Default: 5
*      currPage - Number - This is to determine what the starting current page is. Default: 1
*      optionsForRows - Array - This is to set the values on the rows per page. Default: [5,10,25,50,100]
*      ignoreRows - Array - This is to specify which 'tr' rows to ignore. It is recommended that you have those rows be invisible as they will mess with page counts. Default: []
* @author Ryan Zielke (neoalchemy.org)
* @version 0.1.0
* @requires jQuery v1.2.3 or above
*/
function block()
{
    $.blockUI(
                {
                    message: '<span style="font-family:Tahoma;font-size:12px;color:white;direction:rtl"><img src="../Images/ajaxImages/loading2.gif" /><br />  ...چند لحظه صبر کنید  </span>',
                    fadeIn: 700,
                    fadeOut: 700,
                    css: {
                        border: 'none',
                        padding: '5px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#fff'
                    }
                });
}
(function ($)
{
    $.fn.tablePagination = function (settings)
    {
        var defaults = {
            firstArrow: (new Image()).src = "../Images/first.gif",
            prevArrow: (new Image()).src = "../Images/prev.gif",
            lastArrow: (new Image()).src = "../Images/last.gif",
            nextArrow: (new Image()).src = "../Images/next.gif",
            rowsPerPage: 5,
            currPage: 1,
            optionsForRows: [5,10,15,20,25,30,35,40,45,50,100],
            ignoreRows: []
        };
        settings = $.extend(defaults, settings);

        return this.each(function ()
        {
            var table = $(this)[0];
            var totalPagesId = '#' + table.id + '+#tablePagination #tablePagination_totalPages';
            var currPageId = '#' + table.id + '+#tablePagination #tablePagination_currPage';
            var rowsPerPageId = '#' + table.id + '+#tablePagination #tablePagination_rowsPerPage';
            var firstPageId = '#' + table.id + '+#tablePagination #tablePagination_firstPage';
            var prevPageId = '#' + table.id + '+#tablePagination #tablePagination_prevPage';
            var nextPageId = '#' + table.id + '+#tablePagination #tablePagination_nextPage';
            var lastPageId = '#' + table.id + '+#tablePagination #tablePagination_lastPage';

            var possibleTableRows = $.makeArray($('tbody tr', table));
            var tableRows = $.grep(possibleTableRows, function (value, index)
            {
                return ($.inArray(value, defaults.ignoreRows) == -1);
            }, false)

            var numRows = tableRows.length
            var totalPages = resetTotalPages();
            var currPageNumber = (defaults.currPage > totalPages) ? 1 : defaults.currPage;
            if ($.inArray(defaults.rowsPerPage, defaults.optionsForRows) == -1)
                defaults.optionsForRows.push(defaults.rowsPerPage);

            function hideOtherPages(pageNum)
            {
                if (pageNum == 0 || pageNum > totalPages)
                    return;
                var startIndex = (pageNum - 1) * defaults.rowsPerPage;
                var endIndex = (startIndex + defaults.rowsPerPage - 1);
                $(tableRows).show();
                for (var i = 0; i < tableRows.length; i++)
                {
                    if (i < startIndex || i > endIndex)
                    {
                        $(tableRows[i]).hide()
                    }
                }
            }

            function resetTotalPages()
            {
                var preTotalPages = Math.round(numRows / defaults.rowsPerPage);
                var totalPages = (preTotalPages * defaults.rowsPerPage < numRows) ? preTotalPages + 1 : preTotalPages;
                if ($(totalPagesId).length > 0)
                    $(totalPagesId).html(totalPages);
                return totalPages;
            }

            function resetCurrentPage(currPageNum)
            {
                if (currPageNum < 1 || currPageNum > totalPages)
                    return;
                currPageNumber = currPageNum;
                hideOtherPages(currPageNumber);
                $(currPageId).html(currPageNumber)
            }

            function resetPerPageValues()
            {
                var isRowsPerPageMatched = false;
                var optsPerPage = defaults.optionsForRows;
                //optsPerPage.sort();
                var perPageDropdown = $(rowsPerPageId)[0];
                perPageDropdown.length = 0;
                for (var i = 0; i < optsPerPage.length; i++)
                {
                    if (optsPerPage[i] == defaults.rowsPerPage)
                    {
                        perPageDropdown.options[i] = new Option(optsPerPage[i], optsPerPage[i], true, true);
                        isRowsPerPageMatched = true;
                    }
                    else
                    {
                        perPageDropdown.options[i] = new Option(optsPerPage[i], optsPerPage[i]);
                    }
                }
                if (!isRowsPerPageMatched)
                {
                    defaults.optionsForRows == optsPerPage[0];
                }
            }

            function createPaginationElements()
            {
                var htmlBuffer = [];
                htmlBuffer.push("<div id='tablePagination' style='color: #FFFFFF;border: thin none #5d5852;font-family: Tahoma;font-size: 12px;background-color: #333333;margin: 5px 5px;outline:0;-moz-border-radius:5px;-webkit-border-radius:5px;'>");
                htmlBuffer.push("<span id='tablePagination_perPage'>");
                htmlBuffer.push("تعداد در صفحه : ");
                htmlBuffer.push("<select id='tablePagination_rowsPerPage'><option value='5'>5</option></select>");
                htmlBuffer.push("</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                htmlBuffer.push("<span id='tablePagination_paginater'>");
                htmlBuffer.push("<img id='tablePagination_lastPage' style='cursor:pointer' src='" + defaults.lastArrow + "'>&nbsp;&nbsp;&nbsp;&nbsp;");
                htmlBuffer.push("<img id='tablePagination_nextPage' style='cursor:pointer' src='" + defaults.nextArrow + "'>&nbsp;&nbsp;&nbsp;&nbsp;");
                htmlBuffer.push("&nbsp;&nbsp;&nbsp; صفحه &nbsp;&nbsp;&nbsp;");
                //htmlBuffer.push("<input id='tablePagination_currPage' type='input' disabled='true' value='" + currPageNumber + "' size='1'>");\
                htmlBuffer.push("<span id='tablePagination_currPage' style='color:lime'>" + currPageNumber + "</span>");
                htmlBuffer.push("&nbsp;&nbsp;&nbsp; از &nbsp;&nbsp; <span id='tablePagination_totalPages' style='color:lime'>" + totalPages + "</span>&nbsp;&nbsp;&nbsp;");
                htmlBuffer.push("&nbsp;&nbsp;&nbsp;<img id='tablePagination_prevPage' style='cursor:pointer' src='" + defaults.prevArrow + "'>&nbsp;&nbsp;&nbsp;");
                htmlBuffer.push("<img id='tablePagination_firstPage' style='cursor:pointer' src='" + defaults.firstArrow + "'>&nbsp;&nbsp;&nbsp;&nbsp;");
                htmlBuffer.push("</span>");
                htmlBuffer.push("</div>");
                return htmlBuffer.join("").toString();
            }

            if ($(totalPagesId).length == 0)
            {
                $(this).after(createPaginationElements());
            }
            else
            {
                $('#tablePagination_currPage').html(currPageNumber);
            }
            resetPerPageValues();
            hideOtherPages(currPageNumber);

            $(firstPageId).bind('click', function (e)
            {
                block();
                resetCurrentPage(1);
                $.unblockUI();
            });

            $(prevPageId).bind('click', function (e)
            {
                block();
                resetCurrentPage(currPageNumber - 1);
                $.unblockUI();
            });

            $(nextPageId).bind('click', function (e)
            {
                block();
                resetCurrentPage(currPageNumber + 1);
                $.unblockUI();
            });

            $(lastPageId).bind('click', function (e)
            {
                block();
                resetCurrentPage(totalPages);
                $.unblockUI();
            });

            $(currPageId).bind('change', function (e)
            {
                block();
                resetCurrentPage(this.value);
                $.unblockUI();
            });

            $(rowsPerPageId).bind('change', function (e)
            {
                block();
                defaults.rowsPerPage = parseInt(this.value, 10);
                totalPages = resetTotalPages();
                resetCurrentPage(1);
                $.unblockUI();
            });
        })
    };
})(jQuery);