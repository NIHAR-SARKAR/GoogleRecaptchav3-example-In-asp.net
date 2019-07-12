using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;           
using System.Net.Http;
using System.Configuration;
using Newtonsoft.Json;

namespace GoogleRecaptchav3_example_In_asp_net
{
    public partial class Default : System.Web.UI.Page
    {
        private static string recaptchaSecret = ConfigurationManager.AppSettings["ApiKey"].ToString();
        private static string Token = string.Empty;  
        private static ResponseToken response = new ResponseToken();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static void SetToken(string _token)
        {
            Token = _token; 
        }
        [WebMethod]
        public static string CaptchaVerify()
        {
            //It should only call once
            if(response.score==0)
            {
                var responseString = RecaptchaVerify(Token);
                response = JsonConvert.DeserializeObject<ResponseToken>(responseString.Result);
                
            }
            return JsonConvert.SerializeObject(response);


        }
        private static string apiAddress = "https://www.google.com/recaptcha/api/siteverify"; 

        private static async Task<string> RecaptchaVerify(string recaptchaToken)
        {
            string url = $"{apiAddress}?secret={recaptchaSecret}&response={recaptchaToken}";
            using (HttpClient httpClient = new HttpClient())
            {
                try
                {

                    string responseString = httpClient.GetStringAsync(url).Result;
                    return responseString;

                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }


        public class ResponseToken
        {

            public DateTime challenge_ts { get; set; }
            public float score { get; set; }
            public List<string> ErrorCodes { get; set; }
            public bool Success { get; set; }
            public string hostname { get; set; }
        }
    }
}