using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Text;
using System.Security.Cryptography;

/// <summary>
/// Summary description for PaymentVerification
/// </summary>    
    public class PaymentResult
    {
        public PaymentResult(){}
        private string _transID;      //Payment_ReferenceNumber
        private string _responseCode; //Payment_TransactionState
        private string _responseSubCode;
        private string _response_reason_code;
        private string _response_reason_text;
        private string _login;
        private string _fp_sequence;
        private string _fp_timestamp;
        private string _amount;
        private string _currency_code;
        private string _fp_hash;
        
        public string TransID
        {
            get { return _transID; }
            set { _transID = value; }
        }
        public string ResponseCode
        {
            get { return _responseCode; }
            set { _responseCode = value; }
        }
        public string ResponseSubCode
        {
            get { return _responseSubCode; }
            set { _responseSubCode = value; }
        }
        public string Response_reason_code
        {
            get { return _response_reason_code; }
            set { _response_reason_code = value; }
        }
        public string Response_reason_text
        {
            get { return _response_reason_text; }
            set { _response_reason_text = value; }
        }
        public string Login
        {
            get { return _login; }
            set { _login = value; }
        }
        public string Fp_sequence
        {
            get { return _fp_sequence; }
            set { _fp_sequence = value; }
        }
        public string Fp_timestamp
        {
            get { return _fp_timestamp; }
            set { _fp_timestamp = value; }
        }
        public string Amount
        {
            get { return _amount; }
            set { _amount = value; }
        }
        public string Currency_code
        {
            get { return _currency_code; }
            set { _currency_code = value; }
        }        
        public string Fp_hash
        {
            get { return _fp_hash; }
            set { _fp_hash = value; }
        }
    }
public class PaymentVerification
{
	public PaymentVerification(){}
    public PaymentResult DamoonVerifyMelli(string x_login, string x_fp_sequence, string x_fp_timestamp, string x_amount,
                            string x_currency_code, string x_fp_hash, string x_description, bool isTest)
    {
        PaymentResult paymentResult = new PaymentResult();
        using (var client = new WebClient())
        {
            string s = "https://Damoon.bankmelli-iran.com/DamoonVerificationController?x_description=" + x_description +
                "&x_login=" + x_login + "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp +
                "&x_amount=" + x_amount + "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash;
            var datatopost = Encoding.Default.GetBytes("x_description=" + x_description + "&x_login=" + x_login +
                "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp + "&x_amount=" + x_amount +
                "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash);
            IWebProxy proxy = WebRequest.GetSystemWebProxy();
            var result = client.UploadData(@s, "post", datatopost);
            string dd = Encoding.ASCII.GetString(result);
            string[] arrayofdata = dd.Remove(dd.IndexOf("<")).Split(new char[2] { '&', '=' });
            for (int i = 0; i < arrayofdata.Length; i += 2)
            {                
                //save data[i+1] to database 
                if (arrayofdata[i] == "x_trans_id")
                {
                    paymentResult.TransID = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_response_code")
                {
                    paymentResult.ResponseCode = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_response_subcode")
                {
                    paymentResult.ResponseSubCode = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_response_reason_code")
                {
                    paymentResult.Response_reason_code = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_response_reason_text")
                {
                    paymentResult.Response_reason_text = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_login")
                {
                    paymentResult.Login = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_fp_sequence")
                {
                    paymentResult.Fp_sequence = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_fp_timestamp")
                {
                    paymentResult.Fp_timestamp = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_amount")
                {
                    paymentResult.Amount = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_currency_code")
                {
                    paymentResult.Currency_code = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_fp_hash")
                {
                    paymentResult.Fp_hash = arrayofdata[i + 1].ToString();
                }                                 
            }
        }
        return paymentResult;
    }
    public PaymentResult DamoonVerifySaderat(string x_login, string x_fp_sequence, string x_fp_timestamp, string x_amount,
                        string x_currency_code, string x_fp_hash, string x_description, bool isTest)
    {
        ServicePointManager.ServerCertificateValidationCallback = delegate
        {
            return true;
        };         
        PaymentResult paymentResult = new PaymentResult();
        using (var client = new WebClient())
        {
            string s = "https://Damoon.bsi.ir/DamoonVerificationController?x_description=" + x_description +
                "&x_login=" + x_login + "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp +
                "&x_amount=" + x_amount + "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash;

            var datatopost = Encoding.Default.GetBytes("x_description=" + x_description + "&x_login=" + x_login +
                "&x_fp_sequence=" + x_fp_sequence + "&x_fp_timestamp=" + x_fp_timestamp + "&x_amount=" + x_amount +
                "&x_currency_code=" + x_currency_code + "&x_fp_hash=" + x_fp_hash);
            IWebProxy proxy = WebRequest.GetSystemWebProxy();
            var result = client.UploadData(@s, "post", datatopost);
            string dd = Encoding.ASCII.GetString(result);
            string[] arrayofdata = dd.Remove(dd.IndexOf("<")).Split(new char[2] { '&', '=' });
            for (int i = 0; i < arrayofdata.Length; i += 2)
            {
                //save data[i+1] to database 
                if (arrayofdata[i] == "x_trans_id")
                {
                    paymentResult.TransID = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_response_code")
                {
                    paymentResult.ResponseCode = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_response_subcode")
                {
                    paymentResult.ResponseSubCode = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_response_reason_code")
                {
                    paymentResult.Response_reason_code = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_response_reason_text")
                {
                    paymentResult.Response_reason_text = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_login")
                {
                    paymentResult.Login = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_fp_sequence")
                {
                    paymentResult.Fp_sequence = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_fp_timestamp")
                {
                    paymentResult.Fp_timestamp = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_amount")
                {
                    paymentResult.Amount = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_currency_code")
                {
                    paymentResult.Currency_code = arrayofdata[i + 1].ToString();
                }
                if (arrayofdata[i] == "x_fp_hash")
                {
                    paymentResult.Fp_hash = arrayofdata[i + 1].ToString();
                }
            }
        }
        return paymentResult;
    }
}