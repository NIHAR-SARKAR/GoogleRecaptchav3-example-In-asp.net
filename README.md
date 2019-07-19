# GoogleRecaptchav3-example-In-asp.net


Contribution Guides
--------------------------------------
 reCAPTCHA protects you against spam and other types of automated abuse. Here, we explain how to add reCAPTCHA to your site or application.
 
 reCAPTCHA v3 will never interrupt your users, so you can run it whenever you like without affecting conversion. reCAPTCHA works best when it has the most context about interactions with your site, which comes from seeing both legitimate and abusive behavior. For this reason, we recommend including reCAPTCHA verification on forms or actions as well as in the background of pages for analytics.

Officialy Site : https://developers.google.com/recaptcha/docs/v3

### reCapcha and Asp.net ###
From frontend (.aspx page) you need to send ajax request to pass the token to backend server . Using "recaptcha.execute" U can get the response , and pass the token using ajax request .Please check the code block .
```js
 <script src="http://www.google.com/recaptcha/api.js?render=recaptchaSiteKey"></script>
<script>
 grecaptcha.ready(function() {
 grecaptcha.execute('recaptchaSiteKey', {action: 'homepage'}).then(function(token) {

            $.ajax({
                //pass the toket to Webmethod using Ajax
            });
          });
     });
</script>
```
Now in the aspx.cs you need to write a "[WebMethod]" to receive the token from Ajax request .

```cs
 [WebMethod]
    public static void CaptchaVerify(string token)
    {
            var responseString = RecaptchaVerify(token);
            ResponseToken response = new ResponseToken();
            response = Newtonsoft.Json.JsonConvert.DeserializeObject<ResponseToken>(responseString.Result);

    }
```
To get the response from google recapcha api u need to use async call using httpClient . you also need to create a class which will contain same properties like the response string . After getting the "responseString" u need to convert the response to ResponseToken object by using Newtonsoft.Json. response = Newtonsoft.Json.JsonConvert.DeserializeObject<ResponseToken>(responseString.Result);
  
```cs
      private string recaptchaSecret = googleRecaptchaSecret;

        public async Task<string> RecaptchaVerify(string recaptchaToken)
        {
            string url = $"{apiAddress}?secret={recaptchaSecret}&response={recaptchaToken}";
            using (var httpClient = new HttpClient())
            {
                try
                {

                    string responseString=  httpClient.GetStringAsync(url).Result;
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
```
