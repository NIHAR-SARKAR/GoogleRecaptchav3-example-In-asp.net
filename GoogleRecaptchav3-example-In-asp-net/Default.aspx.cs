using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;

namespace GoogleRecaptchav3_example_In_asp_net
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static void CaptchaVerify(string token)
        {
            var responseString = RecaptchaVerify(token);
            ResponseToken response = new ResponseToken();
            response = Newtonsoft.Json.JsonConvert.DeserializeObject<ResponseToken>(responseString.Result);

        }
        private static string apiAddress = "https://www.google.com/recaptcha/api/siteverify";

        private static string recaptchaSecret = "secret";

        public static async Task<string> RecaptchaVerify(string recaptchaToken)
        {
            string url = $"{apiAddress}?secret={recaptchaSecret}&response={recaptchaToken}";
            using (var httpClient = new HttpClient())
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