using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Web.UI.HtmlControls;
using System.Reflection;
using System.Text;
using iTextSharp.text.html;
using Utils;

public partial class UserControl_SportRacingResultSelected : System.Web.UI.UserControl
{
    //protected string GetUrl(string imagepath)
    //{
    //    string[] splits = Request.Url.AbsoluteUri.Split('/');
    //    if (splits.Length >= 2)
    //    {
    //        string url = splits[0] + "//";
    //        for (int i = 2; i < splits.Length - 1; i++)
    //        {
    //            url += splits[i];
    //            url += "/";
    //        }
    //        return url + imagepath;
    //    }
    //    return imagepath;
    //}
    //public String imageUrl
    //{ get { return Request.Url.GetLeftPart(UriPartial.Authority) +
    //    VirtualPathUtility.ToAbsolute("~/") + ("Images/ajaxImages/ok.gif"); } }

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["racingInfoID"].ToString() != null)
        QueryString qs = QueryString.FromCurrent(); 
        if(qs != null)
        {
          //  String racingInfo_ID = Request.QueryString["racingInfoID"].ToString();
            QueryString qsdec = Utils.QueryStringEncription.DecryptQueryString(qs);
            String racingInfo_ID = qsdec[0];

            lbl_RacingTitle.InnerText = DAL.Sport_GetRaceTitleByRacingInfoID(racingInfo_ID);
            lbl_RacingInfoID.InnerText = racingInfo_ID;
            lbl_activeFormCount.InnerText = PersianClass.getPersianNumberStyle(DAL.Sport_GetCountActiveFormsByRacingInfoID(racingInfo_ID).ToString()) + " عدد";
            int FormAmount, FirstCount, SecondCount;
            float FirstReward, SecondReward;
            DAL.Sport_GetRacingStatisticByRacingInfoID(racingInfo_ID, out FormAmount, out FirstCount, out FirstReward,
                out SecondCount, out SecondReward);
            lbl_FirstCount.InnerText = PersianClass.getPersianNumberStyle(FirstCount.ToString()) + " نفر ";
            lbl_SecondCount.InnerText = PersianClass.getPersianNumberStyle(SecondCount.ToString()) + " نفر ";
            lbl_RacingAmount.InnerText = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",FormAmount)) + " ریال ";
            
            lbl_FirstReward.InnerHtml = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",Math.Round(FirstReward / FirstCount))) + " ریال ";
            lbl_SecondReward.InnerHtml = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",Math.Round(SecondReward / SecondCount))) + " ریال ";
            lbl_SumFirstReward.InnerText = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",Math.Round(FirstReward))) + " ریال ";
            lbl_SumSecondReward.InnerText = PersianClass.getPersianNumberStyle(string.Format("{0:n0}",Math.Round(SecondReward))) + " ریال ";
            lbl_declare_Date.InnerText = PersianClass.getPersiaDate(DAL.Sport_GetLastGameDateByRacingInfoID(racingInfo_ID), "D", false);
            if (!(DAL.Sport_IsNotEnteredRacingGamesResults(racingInfo_ID)))
            {
                gv_RacingSelected.DataSource = DAL.Sport_LoadAllGamesByRacingInfoID(racingInfo_ID);
                gv_RacingSelected.DataBind();
                if (FirstCount > 0 || SecondCount > 0)
                {
                    downloadActiveForm.Visible = false;
                    downloadWinForm.Visible = true;
                }
                else
                {
                    downloadActiveForm.Visible = false;
                    downloadWinForm.Visible = false;
                }
            }
            else
            {
                gv_RacingSelected.DataSource = null;
                gv_RacingSelected.DataBind();
                if (DAL.Sport_GetCountActiveFormsByRacingInfoID(racingInfo_ID) > 0)
                {
                    downloadActiveForm.Visible = true;
                    downloadWinForm.Visible = false;
                }
                else
                {
                    downloadActiveForm.Visible = false;
                    downloadWinForm.Visible = false;
                }
            }
            dl_SelectRacingForResult.DataSource = DAL.Sport_GetWinnerProminenceForms(racingInfo_ID);
            dl_SelectRacingForResult.DataBind();
            //dl_ActiveForms.DataSource = DAL.Sport_GetActiveFormsForPdfByRacingInfoID(racingInfo_ID);
            //dl_ActiveForms.DataBind();
        }
    }
    protected void dl_SelectRacingForResult_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //if ((e.Item.ItemType != ListItemType.Header) && (e.Item.ItemType != ListItemType.Footer))
        //{
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lbl_FormID = (Label)e.Item.FindControl("lbl_FormID");
            GridView gv_RacingResult = (GridView)e.Item.FindControl("gv_RacingResult");
            gv_RacingResult.DataSource = DAL.Sport_LoadAllGamesByFormInfoID(lbl_FormID.Text);
            gv_RacingResult.DataBind();
        }
    }
    //protected void dl_ActiveForms_ItemDataBound(object sender, DataListItemEventArgs e)
    //{
    //    //if ((e.Item.ItemType != ListItemType.Header) && (e.Item.ItemType != ListItemType.Footer))
    //    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        Label lbl_FormID = (Label)e.Item.FindControl("lbl_FormID2");
    //        GridView gv_RacingResult = (GridView)e.Item.FindControl("gv_RacingResult2");
    //        gv_RacingResult.DataSource = DAL.Sport_LoadAllGamesByFormInfoID(lbl_FormID.Text);
    //        gv_RacingResult.DataBind();
    //    }
    //}
    private void ReplaceTextWithImage(String lblStatus, String imgShape, GridViewRowEventArgs e)
    {
        System.Web.UI.WebControls.Image img_WinShape = (System.Web.UI.WebControls.Image)e.Row.FindControl(imgShape);
        Label lbl_WinStatus = (Label)e.Row.FindControl(lblStatus);
        if (lbl_WinStatus.Text == "True")
        {
            img_WinShape.ImageUrl = Request.Url.GetLeftPart(UriPartial.Authority) +
                VirtualPathUtility.ToAbsolute("~/") + "Images/ajaxImages/ChkFill.png";
            img_WinShape.AlternateText = "تیک دار";
        }
        else
        {
            img_WinShape.ImageUrl = Request.Url.GetLeftPart(UriPartial.Authority) +
                VirtualPathUtility.ToAbsolute("~/") + "Images/ajaxImages/ChkEmpty.png";
            img_WinShape.AlternateText = "سفید";
        }
    }
    protected void gv_RacingResult_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ReplaceTextWithImage("lbl_HostWinStatus","img_HostWinShape", e);
            ReplaceTextWithImage("lbl_EqualGame", "img_EqualGame", e);
            ReplaceTextWithImage("lbl_GuestWinStatus", "img_GuestWinShape", e);
        }
    }
    //protected void gv_RacingResult2_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        ReplaceTextWithImage("lbl_HostWinStatus2", "img_HostWinShape2", e);
    //        ReplaceTextWithImage("lbl_EqualGame2", "img_EqualGame2", e);
    //        ReplaceTextWithImage("lbl_GuestWinStatus2", "img_GuestWinShape2", e);
    //    }
    //}
    private static void fixRunDirection(IElement htmlElement)
    {
        if (!(htmlElement is PdfPTable)) return;

        var table = (PdfPTable)htmlElement;
        table.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
        foreach (var row in table.Rows)
        {
            foreach (var cell in row.GetCells())
            {
                cell.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
                foreach (var element in cell.CompositeElements)
                {
                    fixRunDirection(element);
                }
            }
        }
    }
    protected void PDFClick(DataList dl )
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=UserDetails.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        dl.RenderControl(hw);
        dl.Style.Add("font-family", "Tahoma");
        //dl.Style.Add("font-size", "15px");        
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
        //روش صحيح تعريف فونت  
        FontFactory.Register(Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\tahoma.ttf");

        StyleSheet styles = new StyleSheet();
        styles.LoadTagStyle(HtmlTags.BODY, HtmlTags.FONTFAMILY, "tahoma");
        styles.LoadTagStyle(HtmlTags.BODY, HtmlTags.ENCODING, "Identity-H");
        styles.LoadTagStyle(HtmlTags.BODY, HtmlTags.ALIGN, HtmlTags.ALIGN_LEFT);        
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);        
        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        writer.SetFullCompression();
        //writer.SetPdfVersion(PdfWriter.PDF_VERSION_1_7);
        //writer.CompressionLevel = PdfStream.BEST_COMPRESSION;        
        pdfDoc.Open();        
        List<IElement> parsedHtmlElements = HTMLWorker.ParseToList(sr, styles);    
        PdfPCell pdfCell = new PdfPCell { Border = 0 };
        pdfCell.RunDirection = PdfWriter.RUN_DIRECTION_RTL;
       
        foreach (var htmlElement in parsedHtmlElements)
        {           
            fixRunDirection(htmlElement);
            pdfCell.AddElement(htmlElement);
        }
        var table1 = new PdfPTable(1);  
        table1.AddCell(pdfCell);  
        pdfDoc.Add(table1);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
       // BLL.DownloadFolder(Server.MapPath("~/App_Data/Storage"), Response);  
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (downloadWinForm.Visible)
        {
            PDFClick(dl_SelectRacingForResult);
        }
        //else
        //    if (downloadActiveForm.Visible)
        //    {
        //        PDFClick(dl_ActiveForms);
        //    }
    }

    protected void lnl_WinFormDownload_Click(object sender, EventArgs e)
    {
        if (downloadWinForm.Visible)
        {    
            PDFClick(dl_SelectRacingForResult);
        }
        //else
        //    if (downloadActiveForm.Visible)
        //    {
        //        PDFClick(dl_ActiveForms);
        //    }
    }
}


