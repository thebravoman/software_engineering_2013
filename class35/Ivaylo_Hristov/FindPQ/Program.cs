namespace FindPQ
{
    using System;

    public class Program
    {
        public static bool IsPrime(int number)
        {
            double boundary = Math.Floor(Math.Sqrt(number));

            if (number == 1) return false;
            if (number == 2) return true;

            for (int i = 2; i <= boundary; ++i)
            {
                if (number % i == 0) return false;
            }

            return true;
        }

        public static void Main()
        {
            int n;
            int[] pq;

            Console.Write("Enter n: ");
            n = int.Parse(Console.ReadLine());

            pq = FindPQ(n, 128, 1024);
            Console.WriteLine(pq[0] + " " + pq[1]);
        }

        public static int[] FindPQ(int n, int min, int max)
        {
            int i = max;

            for (; i > min; i--)
                if (IsPrime(i))
                    if (IsPrime(n / i)) break;

            return new int[] { i, n / i };
        }
    }
}
