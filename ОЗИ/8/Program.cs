using System.Globalization;
using System.Security.Cryptography;
using System.Text;

namespace oib;
class Crypto
{
    

    static void Main(string[] args)
    {
        

       

        using (RSA myRsa = RSA.Create())
        {
           // string publickey = myRsa.ToXmlString(false);   //получим открытый ключ
            //string privatekey = myRsa.ToXmlString(true);//получим закрытый ключ
            string str = Console.ReadLine();
          
            byte[] data = Encoding.Default.GetBytes(str);



            byte[] encrypted = myRsa.Encrypt(data, RSAEncryptionPadding.Pkcs1);
            byte[] decrypted = myRsa.Decrypt(encrypted, RSAEncryptionPadding.Pkcs1);

            Console.WriteLine("До шифрования:    {0}", str);
            Console.WriteLine("Зашифрованное:    {0}", System.Text.Encoding.UTF8.GetString(encrypted));
            Console.WriteLine("После дешифровки: {0}", System.Text.Encoding.UTF8.GetString(decrypted));
        }


        

    }
   
}