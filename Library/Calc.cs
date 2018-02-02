using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library
{
    public class Calc
    {

        protected int value;

        public int Value
        {
            get => value;
        }

        public Calc()
        {
            Initialize();
        }

        public void Plus(int val1, int val2)
        {
            value = val1 + val2;
        }

        public void Minus(int val1, int val2)
        {
            value = val1 - val2;
        }

        public int Compare(int val1, int val2)
        {
            if (val1 > val2)
            {
                return 1;
            } else if (val1 < val2)
            {
                return -1;
            }
            return 0;
        }

        public void Reset()
        {
            Initialize();
        }

        protected void Initialize()
        {
            value = 0;
        }

    }
}
