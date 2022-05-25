namespace AgropuliApp.Models
{
    public class Alert
    {
        public string Type { get; set; }
        public string Message { get; set; }

        public Alert(string type, string message)
        {
            Type = type;
            Message = message;
        }
    }
}