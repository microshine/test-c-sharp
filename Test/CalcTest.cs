using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Math;

namespace Test
{
    [TestClass]
    public class CompareTest
    {
        [TestMethod]
        public void Greater()
        {
            Assert.AreEqual(Compare.Number(2, 1), 1);
        }
    }
}
