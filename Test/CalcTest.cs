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

        [TestMethod]
        public void Less()
        {
            Assert.AreEqual(Compare.Number(1, 2), -1);
        }

        [TestMethod]
        public void Equal()
        {
            Assert.AreEqual(Compare.Number(2, 2), 0);
        }

    }
}
