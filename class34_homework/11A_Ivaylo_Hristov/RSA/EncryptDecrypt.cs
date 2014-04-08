namespace RSA
{
    using System;
    using System.Numerics;

    public class EncryptDecrypt
    {
        public static int Crypt(int message, int n, int key)
        {
            return (int)(BigInteger.Pow(message, key) % n);
        }

        public static void DoCrypt()
        {
            int n, key, message;
            string command;

            while (true)
            {
                Console.Write("Do you wish to Encrypt ('E') or Decrypt ('D')?: ");
                command = Console.ReadLine();

                if (command == "E" || command == "D") break;
            }

            Console.Write("Enter N: ");
            n = int.Parse(Console.ReadLine());

            Console.Write("Enter key: ");
            key = int.Parse(Console.ReadLine());

            Console.Write("Enter message: ");
            message = int.Parse(Console.ReadLine());

            Console.WriteLine("{0} text: {1}", command == "E" ? "Encrypted" : "Decrypted", Crypt(message, n, key));
        }
    }
}
