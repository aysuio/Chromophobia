using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using System.Web.Routing;

namespace VolatilityTracker
{
    public class DataObject
    {
        public String OpenPrice { get; set; }
        public String HighPrice { get; set; }
        public String LowPrice { get; set; }
        public String ClosePrice { get; set; }
        public String Volume { get; set; }
    }

    internal class GetData_API
    {



        public static async Task<Dictionary<string, Dictionary<string, string>>> RunAsync(HttpClient client, string urlParameters)
        {
            // Update port # in the following line.
            

            try
            {

        // Get the product
                var response = await client.GetAsync(urlParameters);
                if (response.IsSuccessStatusCode)
                {
                    var result = await response.Content.ReadAsStringAsync(); //Make sure to add a reference to System.Net.Http.Formatting.dll
                    Dictionary<string, object> deserializer = JsonConvert.DeserializeObject<Dictionary<string, object>>(result);
                    Dictionary<string, Dictionary<string, string>> price = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string,string>>>(Convert.ToString(deserializer["Time Series (Daily)"]));

                    
                    return price;
                }

                //DataObject dataPoint = await GetDataAsync(urlParameters);
                //ShowData(dataPoint);
                return null;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return null;
            }

        }
    }
}

