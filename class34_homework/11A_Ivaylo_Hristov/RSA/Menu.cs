namespace RSA
{
    using System;

    public class Menu
    {
        public static void Main()
        {
            int command;

            Console.Write("Do you wish to generate keys(1) or Encrypt/Decrypt(2)?: ");
            command = int.Parse(Console.ReadLine());

            if (command == 1)
            {
                GenerateKeys.Generate();
            }
            else if (command == 2)
            {
                EncryptDecrypt.DoCrypt();
            }
        }
    }
}
