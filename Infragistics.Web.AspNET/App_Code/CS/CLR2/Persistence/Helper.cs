using System.Web.UI;

namespace PersistenceSamples
{
    /// <summary>
    /// Summary description for Helper
    /// </summary>
    public class Helper
    {
        public Helper()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        /// <summary>
        /// Search for the control, with a given id, in the whole heirarchy.
        /// </summary>
        /// <param name="root">The root of the hierarchy to be searched</param>
        /// <param name="id">The id if the control to be searched</param>
        /// <returns>The found control</returns>
        public static Control FindControlRecursive(Control root, string id)
        {
            if (root.ID == id)
            {
                return root;
            }
            foreach (Control c in root.Controls)
            {
                Control t = FindControlRecursive(c, id);

                if (t != null)
                {
                    return t;
                }
            }
            return null;
        }
    }
}