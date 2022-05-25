using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace AgropuliApp
{
    public class Helper
    {
        #region Delegates

        private delegate void AsyncSendEmail(
            string to,
            string subject,
            string body);

        #endregion Delegates

        #region Methods

        public static string GetMD5Hash(string input)
        {
            // step 1, calculate MD5 hash from input
            MD5 md5 = System.Security.Cryptography.MD5.Create();

            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hash = md5.ComputeHash(inputBytes);

            // step 2, convert byte array to hex string
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("x2"));
            }

            return sb.ToString();
        }

        public static string GetOrderReference()
        {
            return DateTime.UtcNow.AddHours(-5).ToString("yyMMddHHmmssfff");
        }

        public static void ResizeImage(
            Stream imageStream,
            string imageName,
            string imagePath,
            int size)
        {
            Image image = Image.FromStream(imageStream);

            if (image.Width > size)
            {
                int newWidth = size;
                int newHeight = (newWidth * image.Height) / image.Width;

                image = new Bitmap(image, newWidth, newHeight);
            }

            ImageCodecInfo codec = ImageCodecInfo.GetImageDecoders().FirstOrDefault(x => x.FormatID == ImageFormat.Png.Guid);
            System.Drawing.Imaging.Encoder qualityEncoder = System.Drawing.Imaging.Encoder.Quality;
            EncoderParameters encoderParameters = new EncoderParameters(1);
            encoderParameters.Param[0] = new EncoderParameter(qualityEncoder, 100L);

            string ext = ImageCodecInfo.GetImageEncoders().FirstOrDefault(x => x.FormatID == ImageFormat.Png.Guid)
                .FilenameExtension.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries).First().Trim('*').ToLower();

            string fileName = imagePath + "\\" + imageName + ext;

            image.Save(fileName, codec, encoderParameters);
        }

        #endregion Methods
    }
}