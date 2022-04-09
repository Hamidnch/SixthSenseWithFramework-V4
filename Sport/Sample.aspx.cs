using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Web.UI.HtmlControls;
using System.Text;

public partial class Sport_Sample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["racingInfoID"].ToString() != null)
        {
            String racingInfo_ID = Request.QueryString["racingInfoID"].ToString();
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
        }
    }
    //protected void btn_Exit_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Sport/SportRacingTitles.aspx");
    //}
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
    public override void VerifyRenderingInServerForm(Control control)
    {
        return;
        /* Verifies that the control is rendered */
    }
    /// <summary>

    /// generate the .pdf

    /// </summary>

    /// <param name="path">path of the document</param>

    /// <param name="fileName">name of the .pdf documen</param>

    /// <param name="download">is this downloadable</param>

    /// <param name="text">text to place in the .pdf</param>

    //private void GeneratePDF(string path, string fileName, bool download, string text)
    //{
    //    var document = new Document();
    //    try
    //    {
    //        if (download)
    //        {
    //            PdfWriter.GetInstance(document, Response.OutputStream);
    //        }
    //        else
    //        {
    //            PdfWriter.GetInstance(document, new FileStream(path + fileName, FileMode.Create));
    //        }
    //        // generates the grid first
    //        StringBuilder strB = new StringBuilder();
    //        document.Open();
    //        if (text.Length.Equals(0)) // export the text
    //        {                
    //            using (StringWriter sWriter = new StringWriter(strB))
    //            {

    //                using (HtmlTextWriter htWriter = new HtmlTextWriter(sWriter))
    //                {
    //                    dl_SelectRacingForResult.RenderControl(htWriter);
    //                }
    //            }
    //        }
    //        else // export the grid
    //        {
    //            strB.Append(text);
    //        }
    //        // now read the Grid html one by one and add into the document object
    //        using (TextReader sReader = new StringReader(strB.ToString()))
    //        {
    //            List<IElement> list = HTMLWorker.ParseToList(sReader, new StyleSheet());
    //            foreach (IElement elm in list)
    //            {
    //                document.Add(elm);
    //            }
    //        }
    //    }
    //    catch (Exception ee)
    //    {
    //        Label1.Text = ee.ToString();
    //    }
    //    finally
    //    {
    //        document.Close();
    //    }
    //}
    /// <summary>
    /// Generate .pdf
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    //protected void GeneratePDFAndDownload()
    //{
    //    string fileName = "pdfDocument" + DateTime.Now.Ticks + ".pdf";
    //    GeneratePDF("", fileName, true, "");
    //    Response.Clear();
    //    Response.ContentType = "application/pdf";
    //    Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
    //    Response.Flush();
    //    Response.End();
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
       // GeneratePDFAndDownload();
        //Response.Clear();
        //Response.AddHeader("content-disposition", "attachment; filename=test.pdf");
        //// If you want to save in Excel sheet ,just give test.xls in place of test.pdf 

        //Response.Charset = "";
        //System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        //System.Web.UI.HtmlTextWriter htmlWrite =
        //new HtmlTextWriter(stringWrite);
        //dl_SelectRacingForResult.RenderControl(htmlWrite);
        //Response.Write(stringWrite.ToString());
        //Response.End(); 

        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=UserDetails.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        dl_SelectRacingForResult.DataBind();
        dl_SelectRacingForResult.RenderControl(hw);
        dl_SelectRacingForResult.Style.Add("text-decoration", "none");
        dl_SelectRacingForResult.Style.Add("font-family", "Arial, Helvetica, sans-serif;");
        dl_SelectRacingForResult.Style.Add("font-size", "8px");
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
}