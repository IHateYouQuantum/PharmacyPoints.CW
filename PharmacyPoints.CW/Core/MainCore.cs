using PharmacyPoints.CW.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace PharmacyPoints.CW.Core
{
    public static class MainCore
    {
        public static Frame CoreFrame { get; set; }

        public static PharmacyPointsDBEntities DB { get; set; }
    }
}
