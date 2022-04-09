using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Net;
using System.Text;

public partial class Sport_Sport_MelliVerification : System.Web.UI.Page
{
    private string createfpHash(string signacher)
    {
        string transactionkey = "4n+UD+mdbfpP+DGS";
        System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
        byte[] keyByte = encoding.GetBytes(transactionkey);
        HMACMD5 hmacmd5 = new HMACMD5(keyByte);
        byte[] messageBytes = encoding.GetBytes(signacher);
        byte[] hashmessage = hmacmd5.ComputeHash(messageBytes);
        return signacher = ByteToString(hashmessage);
    }
    private string ByteToString(byte[] buff)
    {
        string sbinary = "";
        for (int i = 0; i < buff.Length; i++)
        {
            sbinary += buff[i].ToString("X2"); // hex format
        }
        return (sbinary);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btn_Verify_Click(object sender, EventArgs e)
    {
        string loginID = "113140784";
        //string[] result = DamoonVerify(loginID, "512", "1303531355", "35000", "Rial", "8058f1c950cee5c985e2da8445e8b3ed", "حس ششم", false);

       //string[] result = DamoonVerify(loginID,txt_fp_sequence.Text.Trim(), txt_fp_timestamp.Text.Trim(), txt_amount.Text.Trim(), txt_currency_code.Text.Trim(), txt_fp_hash.Text.Trim(), "حس ششم", false);
       //for (int i = 0; i < result.Length; i += 2)
       //{
       //    if (result[i] == "x_fp_hash")
       //    {
       //        //save data[i+1] to database .. for example in Payment_HashCode    column
       //        TextBox1.Text = result[i+1].ToString();
       //    }
       //    if (result[i] == "x_currency_code")
       //    {
       //        //save data[i+1] to database               
       //    }
       //    if (result[i] == "x_trans_id")
       //    {
       //        //save data[i+1] to database
       //        TextBox2.Text = result[i+1].ToString();
       //    }
       //} 
        PaymentVerification pamentVerification = new PaymentVerification();
        PaymentResult paymentResult =  new PaymentResult();
        paymentResult = pamentVerification.DamoonVerifyMelli(loginID, txt_fp_sequence.Text.Trim(), txt_fp_timestamp.Text.Trim(), txt_amount.Text.Trim(), txt_currency_code.Text.Trim(), txt_fp_hash.Text.Trim(), "حس ششم", false);
        TextBox1.Text = paymentResult.TransID.ToString();
        TextBox2.Text = paymentResult.ResponseCode.ToString();
        TextBox3.Text = paymentResult.ResponseSubCode.ToString();
        TextBox4.Text = paymentResult.Response_reason_code.ToString();
        TextBox5.Text = paymentResult.Response_reason_text.ToString();
        TextBox6.Text = paymentResult.Login.ToString();
        TextBox7.Text = paymentResult.Fp_timestamp.ToString();
        TextBox8.Text = paymentResult.Fp_sequence.ToString();
        TextBox9.Text = paymentResult.Currency_code.ToString();
        TextBox10.Text = paymentResult.Amount.ToString();
        TextBox11.Text = paymentResult.Fp_hash.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string loginID = "TestMer08";
        //string[] result = DamoonVerify(loginID, "512", "1303531355", "35000", "Rial", "8058f1c950cee5c985e2da8445e8b3ed", "حس ششم", false);

        string[] result = DamoonVerify(loginID, txt_fp_sequence.Text.Trim(), txt_fp_timestamp.Text.Trim(), txt_amount.Text.Trim(), txt_currency_code.Text.Trim(), txt_fp_hash.Text.Trim(), "حس ششم", false);
        for (int i = 0; i < result.Length; i += 2)
        {
            if (result[i] == "x_fp_hash")
            {
                //save data[i+1] to database .. for example in Payment_HashCode    column
                TextBox1.Text = result[i + 1].ToString();
            }
            if (result[i] == "x_currency_code")
            {
                //save data[i+1] to database               
            }
            if (result[i] == "x_trans_id")
            {
                //save data[i+1] to database
                TextBox2.Text = result[i + 1].ToString();
            }
        }


        foreach (string ssss in result)
        {
            Response.Write("<h5 style='color:Green;direction:ltr'>" + ssss + "</h5>");
            Response.Write("</br>");
        }
    }
    public string[] DamoonVerify(string x_login, string x_fp_sequence, string x_fp_timestamp, string x_amount,
                            string x_currency_code, string x_fp_hash, string x_description, bool isTest)
    //,string proxyAddress, string NetUserName, string NetPassword)
    {
        string[] arrayofdata = null;
        using (var client = new WebClient())
        {
            string s = " https://Damoon.bankmelli-iran.com/DamoonVerificationController?x_description=" + x_description +
                "&x_login=" + x_login + "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp +
                "&x_amount=" + x_amount + "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash;
            var datatopost = Encoding.Default.GetBytes("x_description=" + x_description + "&x_login=" + x_login +
                "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp + "&x_amount=" + x_amount +
                "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash);
            // if you use proxy write this if statement else you don’t require this if
            IWebProxy proxy = WebRequest.GetSystemWebProxy();
            var result = client.UploadData(@s, "post", datatopost);
            // do something with the result
            string dd = Encoding.ASCII.GetString(result);
            Response.Write("<Div>");
            Response.Write(dd.Remove(dd.IndexOf("<")));
            Response.Write("</Div>");
            arrayofdata = dd.Remove(dd.IndexOf("<")).Split(new char[2] { '&', '=' });
            return arrayofdata;
        }
    }
}
//اگه دوخط بالاتر اون را نگاه کنید در string dd  داده ها گرفته میشه و از اسپیلیت استفاده میشه ریخته میشه توی آرایه. هم می تونید از string dd  استفاده کنید هم توی همین آرایه loop بزنید مقادیر مورد نظر را پیدا کنید.

//            for (int i = 0; i < data.Length; i+=2)
//            {
//                if (data[i] == "x_fp_hash")
//                {
//       //save data[i+1] to database .. for example in Payment_HashCode    column
//                }
//                if (data[i] == "x_currency_code")
//                {
//                    //save data[i+1] to database
//                }
//                if (data[i] == "x_trans_id")
//                {
//                     //save data[i+1] to database
//                }                
//                }   
//public partial class Sport_Sport_MelliVerification : System.Web.UI.Page
//{
//    private string createfpHash(string signacher)
//    {
//        string transactionkey =  "4n+UD+mdbfpP+DGS";
//        System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
//        byte[] keyByte = encoding.GetBytes(transactionkey);
//        HMACMD5 hmacmd5 = new HMACMD5(keyByte);
//        byte[] messageBytes = encoding.GetBytes(signacher);
//        byte[] hashmessage = hmacmd5.ComputeHash(messageBytes);
//        return signacher = ByteToString(hashmessage);
//    }
//    private string ByteToString(byte[] buff)
//    {
//        string sbinary = "";

//        for (int i = 0; i < buff.Length; i++)
//        {
//            sbinary += buff[i].ToString("X2"); // hex format
//        }
//        return (sbinary);
//    }
//    protected void Page_Load(object sender, EventArgs e)
//    {

//    }
//    protected void btn_Verify_Click(object sender, EventArgs e)
//    {
//        string loginID = "TestMer08";
//        //string fp_HashCode = createfpHash("9f0f0bfcaeea8d9e2de78fc6fdd8d6b5");
//        //string[] result = DamoonVerify(loginID, "367", "1303322156", "1500", "Rial", fp_HashCode, "Sample Transaction",true);
//        string hashCode = createfpHash("b3a08a183dbeee08acee5a0ad0f43c46");
//        string[] result = DamoonVerify(loginID, "673", "1303322123", "2500", "Rial", hashCode, "Sample Transaction", false);
//        foreach (string ssss in result)
//        {
//            Response.Write(ssss);
//            Response.Write("</br>");
//        }
//        //using (var client = new WebClient())
//        //{
//        //    var datatopost = Encoding.Default.GetBytes(""); //encoding.default.getbytes("param1=value1&param2=value2");
//        //    string emza = createfpHash("737218180013^577^1265011576^1^Rial");
//        //    var result = client.UploadData(@"https://Damoon.bsi.ir/DamoonVerificationController?x_description=hesesheshom&x_login=TestMer08&x_fp_sequence=577&x_fp_timestamp=1265011576&x_amount=1&x_currency_code=Rial&x_fp_hash=" +
//        //       emza, "post", datatopost);
//        //    // do something with the result
//        //    string dd = Encoding.ASCII.GetString(result);
//        //    Response.Write("<Div>");
//        //    Response.Write(dd.Remove(dd.IndexOf("<")));
//        //    Response.Write("</Div>");
//        //    string[] arrayofdata = dd.Remove(dd.IndexOf("<")).Split(new char[2] { '&', '=' });
//        //    foreach (string ssss in arrayofdata)
//        //    {
//        //        Response.Write(ssss);
//        //        Response.Write("</br>");
//        //    }
//        //}

//    }
//    public string[] DamoonVerify(string x_login, string x_fp_sequence, string x_fp_timestamp, string x_amount, 
//                                string x_currency_code, string x_fp_hash, string x_description, bool isTest) 
//                                //,string proxyAddress, string NetUserName, string NetPassword)
//    {
//        string[] arrayofdata = null;
//        using (var client = new WebClient())
//        {
//            string s = " https://Damoon.bankmelli-iran.com/VerificationTestController?x_description=" + x_description + "&x_login=" + x_login
//                + "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp
//                + "&x_amount=" + x_amount + "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash;
//            var datatopost = Encoding.Default.GetBytes("x_description=" + x_description + "&x_login=" + x_login + "&x_fp_sequence=" + x_fp_sequence +
//                "&x_fp_timestamp=" + x_fp_timestamp + "&x_amount=" + x_amount + "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash);
//            // if you use proxy write this if statement else you don’t require this if               
//            IWebProxy proxy = WebRequest.GetSystemWebProxy();
//            if (proxy != null && proxy.Credentials != null)
//            {
//                client.Proxy = proxy;
//            }
//            else
//            {
//                proxy = new WebProxy("192.168.18.15:80");
//                proxy.Credentials = new NetworkCredential("m_mokhtari", "gwt$1289");
//                client.Proxy = proxy;
//            }
//            var result = client.UploadData(@s, "post", datatopost);
//            // do something with the result
//            string dd = Encoding.ASCII.GetString(result);
//            Response.Write("<Div>");
//            Response.Write(dd.Remove(dd.IndexOf("<")));
//            Response.Write("</Div>");
//            arrayofdata = dd.Remove(dd.IndexOf("<")).Split(new char[2] { '&', '=' });
//            return arrayofdata;
//        }
//    }
//}


//ببخشید ولی verification  اینطوری با فرمpost نمی شود . نحوه ارسال request متفاوت است.

//در ضمن آدرس دقیق url مربوط به receipt page  را باید بفرستید

//public ActionResult DamoonVerify(string x_login, string x_fp_sequence,string x_fp_timestamp,
//                                        string x_amount, string x_currency_code, string x_fp_hash, string x_description, bool isTest,
//                                        string proxyAddress, string NetUserName, string NetPassword)
//        {
//            string[] arrayofdata = null;
//            using (var client = new WebClient())
//            {
//                string s = " https://Damoon.bankmelli-iran.com/VerificationTestController?x_description=x_description&x_login=" + x_login
//                    + "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp
//                    + "&x_amount=" + x_amount + "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash;
//                var datatopost = Encoding.Default.GetBytes("x_description=x_description&x_login=" + x_login
//                    + "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp
//                    + "&x_amount=" + x_amount + "&x_currency_code=" + x_currency_code + "&x_fp_hash="  + x_fp_hash);
//// if you use proxy write this if statement else you don’t require this if               
//IWebProxy proxy = WebRequest.GetSystemWebProxy();
//                if (proxy != null && proxy.Credentials != null)
//                {
//                    client.Proxy = proxy;
//                }
//                else
//                {
//                    proxy = new WebProxy("192.168.18.15:80");
//                    proxy.Credentials = new NetworkCredential("m_mokhtari", "gwt$1289");
//                    client.Proxy = proxy;
//                }
//                var result = client.UploadData(@s, "post", datatopost);
//                // do something with the result
//                string dd = Encoding.ASCII.GetString(result);
//                arrayofdata = dd.Remove(dd.IndexOf("<")).Split(new char[2] { '&', '=' });
//return arrayofdata; 

//            }