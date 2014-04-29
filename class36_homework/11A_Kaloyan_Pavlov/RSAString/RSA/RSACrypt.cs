using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Numerics;
namespace RSA
{

    class RSACrypt
    {
        private static System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
        private static string Crypt(string message, BigInteger key1, BigInteger key2)
        {
            byte[] byteMessage = encoding.GetBytes(message);
            BigInteger bigInt = new BigInteger(byteMessage);
            BigInteger newint = BigInteger.ModPow(bigInt, key1, key2);
            return System.Text.Encoding.Default.GetString(newint.ToByteArray());
        }

        static void Main(string[] args)
        {
            Console.WriteLine("Enter key1 then key2");
            BigInteger key1 = BigInteger.Parse(Console.ReadLine());
            BigInteger key2 = BigInteger.Parse(Console.ReadLine());
            Console.WriteLine("Enter message");
            string message = Console.ReadLine();
            string crypt = Crypt(message, key1, key2);
            Console.WriteLine("Crypt: {0}", crypt);
        }
    }
}