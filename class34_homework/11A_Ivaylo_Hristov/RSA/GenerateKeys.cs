namespace RSA
{
    using System;

    public class GenerateKeys
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

        public static int[][] Generate()
        {
            var rng = new Random();
            int p, q, n, fn, e, d;

            while (true)
            {
                p = rng.Next(128, 512);
                if (IsPrime(p)) break;
            }
            while (true)
            {
                q = rng.Next(128, 512);
                if (IsPrime(q) && p != q) break;
            }

            n = p * q;
            fn = (p - 1) * (q - 1);

            while (true)
            {
                e = rng.Next(1, fn);
                if (IsPrime(e) && fn % e != 0) break;
            }

            d = 0;
            while (true)
            {
                if ((e * d) % fn == 1) break;
                d += 1;
            }

            Console.WriteLine("Public = ({0}, {1})", n, e);
            Console.WriteLine("Private = ({0}, {1})", n, d);

            return new int[][] { new int[] { n, e }, new int[] { n, d } };
        }
    }
}
